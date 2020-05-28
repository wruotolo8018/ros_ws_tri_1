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

# Accessory functions 
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
        
# TODO: Debugging
def tendon_sns_callback(data):
    # Bump old data to prev variable
    global prev_tendon_data, cur_tendon_data
    prev_tendon_data = cur_tendon_data
    # Fill cur_tendon_data with updated data
    cur_tendon_data[0] = data.prox1
    cur_tendon_data[1] = data.dist1
    cur_tendon_data[2] = data.hype1
    
    cur_tendon_data[3] = data.prox2
    cur_tendon_data[4] = data.dist2
    cur_tendon_data[5] = data.hype2

    cur_tendon_data[6] = data.prox3
    cur_tendon_data[7] = data.dist3
    cur_tendon_data[8] = data.hype3
    

# TODO: Debugging
def joint_sns_callback(data):
    # Bump old data to prev variable
    global prev_joint_data, cur_joint_data
    prev_joint_data = cur_joint_data
    cur_joint_data[0] = data.prox1
    cur_joint_data[1] = data.dist1
    cur_joint_data[2] = data.prox2
    cur_joint_data[3] = data.dist2
    cur_joint_data[4] = data.prox3
    cur_joint_data[5] = data.dist3
    # Fill cur_tendon_data with updated data


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

def simple_PID(des_prox, des_dist):
    global cur_joint_data, cur_pwm_array, cur_motor_string
    kp1 = 1
    kp2 = 1               
    Ppwm = -kp1*(des_prox - cur_joint_data[0])
    Dpwm = -kp2*(des_dist - cur_joint_data[1])
    Hpwm = kp1*(des_prox - cur_joint_data[0]) + kp2*(des_dist - cur_joint_data[1])
    
    if (Ppwm < -25):
        Ppwm = -25
    elif (Ppwm > 25):
        Ppwm = Ppwm/2
        if (Ppwm > 25):
            Ppwm = 25
    Ppwm = 50 + Ppwm
    
    if (Dpwm < -25):
        Dpwm = -25
    elif (Dpwm > 25):
        Dpwm = Dpwm/2
        if (Dpwm > 25):
            Dpwm = 25
    Dpwm = 50 + Dpwm
    
    if (Hpwm < -25):
        Hpwm = -25
    elif (Hpwm > 25):
        Hpwm = Hpwm/2
        if (Hpwm > 25):
            Hpwm = 25
    Hpwm = 50 + Hpwm
    
    
    cur_pwm_array[3:6] = [Ppwm, Dpwm, Hpwm]
    print(cur_pwm_array)
    cur_motor_string = pwm_array_to_string(cur_pwm_array)
    return cur_motor_string

# Main loop
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_serial_interface', anonymous=True)
    
    # Setup subscription to cmd_motor_controller topic
    rospy.Subscriber("master_state", String, state_callback)
    rospy.Subscriber("finger_tendon_sensors", tendon_sns, tendon_sns_callback)
    rospy.Subscriber("finger_joint_sensors", joint_sns, joint_sns_callback)
    cmdPub = rospy.Publisher('motor_cmd', String, queue_size=10)
    
    # Temp subscriber to manual pose topic
#    rospy.Subscriber("desired_pose", Int16, pose_change_callback)
    
    # Global variables
    global cur_pwm_array, cur_des_pose
    
    # Set loop speed
    rate = rospy.Rate(50) #50hz
    
    # Output that things are going
    print("Running motor_controller node.")

    while not rospy.is_shutdown():  
        # Internal state machine
        if (state == STOPPED): 
            cmdPub.publish(stop_motor_string)
            cur_motor_string = stop_motor_string
            cur_pwm_array = stop_motor_array
        elif (state == MOVE_TO_POSE_1):
            des_prox_value = 85
            des_dist_value = 80
            cur_motor_string = simple_PID(des_prox_value, des_dist_value)
        elif (state == MOVE_TO_POSE_2):
            des_prox_value = 45
            des_dist_value = 45
            cur_motor_string = simple_PID(des_prox_value, des_dist_value)
        elif (state == MOVE_TO_POSE_3):
            des_prox_value = 65
            des_dist_value = 65
            cur_motor_string = simple_PID(des_prox_value, des_dist_value)       
        elif (state == TIGHTEN):
            cur_pwm_array[3:6] = [60,60,60]
            cur_motor_string = pwm_array_to_string(cur_pwm_array)
        elif (state == LOOSEN):
            cur_pwm_array[3:6] = [40,40,40]
            cur_motor_string = pwm_array_to_string(cur_pwm_array)
            
        print(cur_motor_string)
        cmdPub.publish(cur_motor_string)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    