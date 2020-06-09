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
state = STOPPED

# Useful saved motor values
stop_motor_string = "505050505050505050"
forward_motor_string = "505050606060505050"
backward_motor_string = "505050404040505050"
stop_motor_array = np.array([50,50,50,50,50,50,50,50,50])

# Basic sensor data variables
cur_tendon_data = np.zeros(9)
prev_tendon_data = np.zeros(9)
cur_joint_data = np.zeros(6)
prev_joint_data = np.zeros(6)

# PWM variables
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
def pwm_array_to_string(pwm_array):
    pwm_string = ""
    for val in pwm_array:
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
    global cur_joint_data, cur_pwm_array
    
    # Set control variables
    kp1 = 0.1
    kp2 = 0.1   
    one_dir_pmw_cap = 25 # In PWM, not sensor values
    one_dir_deadzone = 0 # In PWM, not sensor values
    prox_index = fing_num*2
    dist_index = fing_num*2+1
    
    # Run basic proportional control law
    Ppwm = int(-kp1*(des_prox - cur_joint_data[prox_index]))
    Dpwm = int(-kp2*(des_dist - cur_joint_data[dist_index]))
    Hpwm = int(kp1*(des_prox - cur_joint_data[prox_index]) + kp2*(des_dist - cur_joint_data[dist_index]))
    # Cap pwm to max for component safety (there should be another larger cap at end of controls)
    Ppwm = pwm_cap(Ppwm, one_dir_pmw_cap)
    Dpwm = pwm_cap(Dpwm, one_dir_pmw_cap)
    Hpwm = pwm_cap(Hpwm, one_dir_pmw_cap)
    
    # Apply a deadzone if needed for stability (was originally working fine without)
    Ppwm = process_deadzone(Ppwm, one_dir_deadzone)
    Dpwm = process_deadzone(Dpwm, one_dir_deadzone)
    Hpwm = process_deadzone(Hpwm, one_dir_deadzone)
    
    # Center around middle value based on 0-99 pwm convention
    Ppwm = Ppwm + 50
    Dpwm = Dpwm + 50
    Hpwm = Hpwm + 50
    
    # Set pwm array values based on updates
    cur_pwm_array[fing_num*3 : fing_num*3+3] = [Ppwm, Dpwm, Hpwm]
    # Print updated pwm array for debugging
    print(cur_pwm_array)


# Simple PID control on contact pressure centroid
def contact_control(des_xc, fing_num):
    # TODO: adjust torques to change pressure centroid
    # Need sensors for this
    # So currently do nothing
    x = 1
  
    
# Simple PID control grasp force
def grasp_force_control(des_fn, fing_num):
    # TODO: adjust torques to change grasp force
    # Need sensors for this
    # So currently do nothing
    x = 1
   
    
# Tendon sensing adaptor to prevent tendon laxity 
def tendon_tension_control():
    # Access global variables
    global cur_tendon_data, cur_pwm_array
    # Set Control variables
    binary_gain = 10
    # TODO: go through tendon tension sensors and modifty to tighten if loose


def gain_filter():
    # TODO: based on state, select gain filter params
    # Arrange arrays and apply math
    # Currently not implemented
    x = 1


def final_pwm_cap(one_dir_final_cap):
    # Access global variables
    global cur_pwm_array
    # Iterate through PWM array and apply cap
    for i in range(len(cur_pwm_array)):
        cur_pwm_array[i] = 50 + pwm_cap(cur_pwm_array[i] - 50, one_dir_final_cap)
    # TODO: Debugging


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
    
    # Set loop speed
    rate = rospy.Rate(50) #50hz
    
    # Output that things are going
    print("Running motor_controller node.")

    while not rospy.is_shutdown():  
        # Internal state machine sets pwm array based on state and sensed values
        if (state == STOPPED): 
            cmdPub.publish(stop_motor_string)
            cur_motor_string = stop_motor_string
            cur_pwm_array = stop_motor_array
        
        elif (state == MOVE_TO_POSE_1):
            des_prox_value = 850
            des_dist_value = 800
            position_control(des_prox_value, des_dist_value,1)
            # TODO: contact PID
            # TODO: grasp force PID
            # TODO: filter with gain scheduler
            # TODO: modify based on tendon tension
            final_pwm_cap(35);
        
        elif (state == MOVE_TO_POSE_2):
            des_prox_value = 450
            des_dist_value = 450
            position_control(des_prox_value, des_dist_value,1)
        
        elif (state == MOVE_TO_POSE_3):
            des_prox_value = 650
            des_dist_value = 650
            position_control(des_prox_value, des_dist_value,1)     
       
        elif (state == TIGHTEN):
            cur_pwm_array[3:6] = [60,60,60]
        elif (state == LOOSEN):
            cur_pwm_array[3:6] = [40,40,40]
            
        # Process pwm array into string for serial comms
        cur_motor_string = pwm_array_to_string(cur_pwm_array)
        # Print current motor string for debugging purposes
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
    
    