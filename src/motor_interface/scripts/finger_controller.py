#!/usr/bin/env python
# license removed for brevity

# Imports
import rospy
from std_msgs.msg import String, Int16
import serial
import time
import numpy as np
from tae_psoc.msg import SensorPacket, cmdToPsoc, Sensor_Fast, Sensor_Indiv
from basic_sensor_interface.msg import tendon_sns, joint_sns

# state definitions
MOVE_TO_POSE_1 = 2
MOVE_TO_POSE_2 = 3
MOVE_TO_POSE_3 = 4
TIGHTEN = 5
LOOSEN = 6
STOPPED = 0
PURE_CONTACT_CONTROL = 1

state = STOPPED

# Useful saved motor values
stop_motor_string = "505050505050505050"
forward_motor_string = "505050606060505050"
backward_motor_string = "505050404040505050"
stop_motor_array = np.array([0,0,0,0,0,0,0,0,0])

# Basic sensor data variables
cur_tendon_data = np.zeros(9)
prev_tendon_data = np.zeros(9)
tendon_binary_engagement = np.zeros(9)
tendon_binary_cutoff = np.array([0,0,0,100,100,250,0,0,0])
cur_joint_data = np.zeros(6)
prev_joint_data = np.zeros(6)

# Nib sensor data variables
cur_nib_data = np.zeros(36)
prev_nib_data = np.zeros(36)

# PWM variables
pos_pwm_array = np.zeros(9)
contact_pwm_array = np.zeros(9)
force_pwm_array = np.zeros(9)
tension_pwm_array = np.zeros(9)
cur_pwm_array = np.zeros(9)


# Accessory function to conveniently map one range of values to another
def arduino_map(val, inMin, inMax, outMin, outMax):
    return int((val-inMin)*(outMax-outMin)/(inMax-inMin)+outMin)


# Callback functions    
def state_callback(data):
    incomingString = str(data.data)
    global state
#    print("Incoming command: " + incomingString)
    
    if (incomingString == "move_to_pose_1"):
        state = MOVE_TO_POSE_1
        print("Switching state to MOVE_TO_POSE_1")
    elif (incomingString == "move_to_pose_2"):
        state = MOVE_TO_POSE_2
        print("Switching state to MOVE_TO_POSE_2")
    elif (incomingString == "move_to_pose_3"):
        state = MOVE_TO_POSE_3
        print("Switching state to MOVE_TO_POSE_3")
    elif (incomingString == "stop"):
        state = STOPPED
        print("Switching state to STOPPED")
    elif (incomingString == "tighten"):
        state = TIGHTEN
        print("Switching state to TIGHTEN")
    elif (incomingString == "loosen"):
        state = LOOSEN
        print("Switching state to LOOSEN")
    elif (incomingString == "pure_contact"):
        state = PURE_CONTACT_CONTROL
        print("Switching state to PURE_CONTACT_CONTROL")
        
        
   
    
# Callback function for tendon force sensing data     
def tendon_sns_callback(data):
    # Bump old data to prev variable
    global prev_tendon_data, cur_tendon_data
    prev_tendon_data = cur_tendon_data
    # Fill cur_tendon_data with updated data
    # Finger 1
    cur_tendon_data[0] = data.prox1
    cur_tendon_data[1] = data.dist1
    cur_tendon_data[2] = data.hype1
    # Finger 2
    cur_tendon_data[3] = data.prox2
    cur_tendon_data[4] = data.dist2
    cur_tendon_data[5] = data.hype2
    # Thumb
    cur_tendon_data[6] = data.prox3
    cur_tendon_data[7] = data.dist3
    cur_tendon_data[8] = data.hype3
    
    # Go through and set binary values for taught or not
    for i in range(9):
        if (cur_tendon_data[i] > tendon_binary_cutoff[i]):
            tendon_binary_engagement[i] = 1
        else:
            tendon_binary_engagement[i] = 0
    
    
# Callback function for joint position sensing data
def joint_sns_callback(data):
    # Bump old data to prev variable
    global prev_joint_data, cur_joint_data
    prev_joint_data = cur_joint_data
    # Finger 1
    cur_joint_data[0] = data.prox1
    cur_joint_data[1] = data.dist1
    # Finger 2
    cur_joint_data[2] = data.prox2
    cur_joint_data[3] = data.dist2
    # Thumb
    cur_joint_data[4] = data.prox3
    cur_joint_data[5] = data.dist3


# Convert array of pwm ints to single string format for serial transmission
# and center around 50 instead of 0
def pwm_array_to_string(pwm_array):
    pwm_string = ""
    # Center around 50 for transmission without negatives
    pwm_array_temp = pwm_array + 50
    # Modify values to ensure 2 digits for each
    for val in pwm_array_temp:
        if (val > 99):
            val = 99
        elif (val < 0):
            val = 0
        if (val < 10):
            pwm_string = pwm_string + "0" + str(int(val))
        else:
            pwm_string = pwm_string + str(int(val))
    return pwm_string


# Accessory function to handle pwm capping at various stages
def pwm_cap(pwmVal, capVal):
    if (pwmVal < -capVal):
        pwmVal = -capVal
    elif (pwmVal > capVal):
        pwmVal = capVal
    return pwmVal    
    

# Accessory function to implement deadzones for stability
def process_deadzone(pwmVal, deadzone_val):
    if (pwmVal < deadzone_val and pwmVal > -deadzone_val):
        pwmVal = 0
    return pwmVal


# Simple PID (really just P rn) control function to update pwm values based on sensed joint angles
def position_control(des_prox, des_dist, fing_num):
    # Access global variables
    global cur_joint_data, pos_pwm_array
    
    # Set control variables
    kp1 = 0.3
    kp2 = 0.3  
    looseScale = 0.75
    one_dir_pmw_cap = 30 # In PWM/2, not sensor values
    one_dir_deadzone = 0 # In PWM/2, not sensor values
    prox_index = fing_num*2
    dist_index = fing_num*2+1
    
    # Run basic proportional control law
    Ppwm = int(kp1*(des_prox - cur_joint_data[prox_index]))
    Dpwm = int(kp2*(des_dist - cur_joint_data[dist_index]))
    Hpwm = int(-(kp1*(des_prox - cur_joint_data[prox_index]) + kp2*(des_dist - cur_joint_data[dist_index])))

    if (Ppwm < 0):
        Ppwm = Ppwm*looseScale
    if (Dpwm < 0):
        Dpwm = Dpwm*looseScale
    if (Hpwm < 0):
        Hpwm = Hpwm*looseScale*.1
    
    
    # Cap pwm to max for component safety (there should be another larger cap at end of controls)
    Ppwm = pwm_cap(Ppwm, one_dir_pmw_cap)
    Dpwm = pwm_cap(Dpwm, one_dir_pmw_cap)
    Hpwm = pwm_cap(Hpwm, one_dir_pmw_cap)
    
    # Apply a deadzone if needed for stability (was originally working fine without)
    Ppwm = process_deadzone(Ppwm, one_dir_deadzone)
    Dpwm = process_deadzone(Dpwm, one_dir_deadzone)
    Hpwm = process_deadzone(Hpwm, one_dir_deadzone)
    
    # Set pwm array values based on updates
    pos_pwm_array[fing_num*3 : fing_num*3+3] = [Ppwm, Dpwm, Hpwm]
    
    # Print updated pwm array for debugging
    # print(pos_pwm_array)


# Simple PID control on contact pressure centroid
def contact_control(des_xc, fing_num):
    # TODO: adjust contact_pwm_array based on pressure centroid
    # Need sensors for this
    # So currently do nothing
    x = 1
  
    
# Simple PID control grasp force
def grasp_force_control(des_fn, fing_num):
    # TODO: modify force_pwm_array based on sensed grasp force
    # Need sensors for this
    # So currently do nothing
    x = 1
   
    
# Tendon sensing adaptor to prevent tendon laxity 
def tendon_tension_control(fing_num):
    # Access global variables
    global cur_tendon_data, cur_pwm_array, tendon_binary_cutoff, tendon_binary_engagement, tension_pwm_array
    
    # Set Control variables
    binary_gain = 30
    
    # Go through tendon tension sensors and modifty to tighten if loose
    # TODO: Debug
    prox_index = fing_num*3
    dist_index = fing_num*3+1
    hype_index = fing_num*3+2
    for i in range(prox_index, hype_index):
        # If loose, tighten
        if (tendon_binary_engagement[i] == 0):
            tension_pwm_array[i] = binary_gain
        # If already tense, do nothing
        else:
            tension_pwm_array[i] = 0
    # Add binary adjustments to cur_pwm_array for processing before pwm cap
    for i in range(len(cur_pwm_array)):
        cur_pwm_array[i] += float(tension_pwm_array[i])
    

def gain_filter(fing_num):
    # Access global variables
    global pos_pwm_array, contact_pwm_array, force_pwm_array, cur_pwm_array
    
    # TODO: Define control variables based on state
    kp = 1
    kc = 0
    kf = 0
    
    # Create manipulation matrices
    prox_index = fing_num*3
    dist_index = fing_num*3+1
    hype_index = fing_num*3+2
    
    # Build full vector of possible pwm values
    pos_vec = pos_pwm_array[prox_index:hype_index+1]
    contact_vec = contact_pwm_array[prox_index:hype_index+1]
    force_vec = force_pwm_array[prox_index:hype_index+1]
    full_vec = np.transpose(np.hstack((np.hstack((pos_vec,contact_vec)),force_vec)))
    
    # Build filter array out of diagonal sub-matrices
    kp_arr = kp*np.identity(3)
    kc_arr = kc*np.identity(3)
    kf_arr = kf*np.identity(3)
    filter_array = np.hstack((np.hstack((kp_arr,kc_arr)),kf_arr))
    
    # Take dot product of filter and full vector of pwm values
    final_pwm_vec = np.dot(filter_array,full_vec)
    
    # Debugging print of resultant finger pwms
    # print("Finger " + str(fing_num) + " pwm values after filter: " + str(final_pwm_vec))
    
    # Set cur_pwm_array values to result of filtering operation
    cur_pwm_array[prox_index:hype_index+1] = final_pwm_vec


# Final safety function to put a cap on max PWM
def final_pwm_cap(one_dir_final_cap):
    # Access global variables
    global cur_pwm_array
    # Iterate through PWM array, apply cap, and shift center
#    for i in range(len(cur_pwm_array)):
#        cur_pwm_array[i] = pwm_cap(cur_pwm_array[i], one_dir_final_cap)


# Main loop
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_serial_interface', anonymous=True)
    
    # Setup subscription to cmd_motor_controller topic
    rospy.Subscriber("master_state", String, state_callback)
    rospy.Subscriber("finger_tendon_sensors", tendon_sns, tendon_sns_callback)
    rospy.Subscriber("finger_joint_sensors", joint_sns, joint_sns_callback)
    cmdPub = rospy.Publisher('motor_cmd', String, queue_size=10)
     
    # Global variables
    global cur_pwm_array, cur_des_pose
    print("Start PWM ARRAY: " + str(cur_pwm_array))
    
    # Set loop speed
    rate = rospy.Rate(50) #50hz
    
    # Output that things are going
    print("Running motor_controller node.")

    while not rospy.is_shutdown():  
        # Internal state machine sets pwm array based on state and sensed values
        if (state == MOVE_TO_POSE_1):
            # Define desired position values for testing
            des_prox_value = 0
            des_dist_value = 0
            
            # Run proportional control on the des and sensed pos values
            position_control(des_prox_value, des_dist_value,1)
            
            # TODO: contact PID
            
            # Apply the new gain filter idea to set cur_pwm_array
            gain_filter(1)
            
            # Modify based on tendon tension
            tendon_tension_control(1)
            
            # Cap final pwm value 
            final_pwm_cap(35);
        
        elif (state == MOVE_TO_POSE_2):
            # Define desired position values for testing
            des_prox_value = 400
            des_dist_value = 300
            
            # Run proportional control on the des and sensed pos values
            position_control(des_prox_value, des_dist_value,1)
                        
            # Apply the new gain filter idea to set cur_pwm_array
            gain_filter(1)
            
            # TODO: modify based on tendon tension
            tendon_tension_control(1)
           
            # Cap final pwm value 
            final_pwm_cap(35);
        
        elif (state == MOVE_TO_POSE_3):
            # Define desired position values for testing
            des_prox_value = 400
            des_dist_value = -300
            
            # Run proportional control on the des and sensed pos values
            position_control(des_prox_value, des_dist_value,1)
                        
            # Apply the new gain filter idea to set cur_pwm_array
            gain_filter(1)
            
            # TODO: modify based on tendon tension
            tendon_tension_control(1)
           
            # Cap final pwm value 
            final_pwm_cap(35);   
       
        elif (state == PURE_CONTACT_CONTROL):
            print("In state of pure contact control!!!!")
            
        
        elif (state == TIGHTEN):
            cur_pwm_array[3:6] = [10,10,10]
        
        elif (state == LOOSEN):
            cur_pwm_array[3:6] = [-10,-10,-10]
            
        # Process pwm array into string for serial comms
        cur_motor_string = pwm_array_to_string(cur_pwm_array)
        
        # Final safety check for stopped conditions
        if (state == STOPPED): 
            cmdPub.publish(stop_motor_string)
            cur_motor_string = stop_motor_string
            cur_pwm_array = stop_motor_array
        
        # Print current motor pwm values and resulting string for debugging purposes
        print("PWM Array: " + str(cur_pwm_array))
        print("Current motor string: " + cur_motor_string)
        
        # Publish current motor string for motor interface to handle
        cmdPub.publish(cur_motor_string)
        
        # Sleep to maintain command update rate
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    