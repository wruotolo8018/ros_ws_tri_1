#!/usr/bin/env python
# license removed for brevity

# Imports
import rospy
from std_msgs.msg import String
import serial
import time
import numpy as np
from tae_psoc.msg import SensorPacket
from tae_psoc.msg import cmdToPsoc
from tae_psoc.msg import Sensor_Fast
from tae_psoc.msg import Sensor_Indiv

# state definitions
MOVE_TO_POSE = 2
BLIND_GRASPING = 3
STOPPED = 0
MANUAL_INPUT = 1
state = STOPPED

## Manual state variables
#manual_motor_string = "505050505050505050"

## Drive hand state variables
#sensor_1_vector = np.zeros(4)
#sensor_2_vector = np.zeros(4)
#sensor_3_vector = np.zeros(4)
#drive_motor_string = "505050505050505050"

# Useful saved motor strings
stop_motor_string = "505050505050505050"

# Basic sensor data variables
cur_tendon_data = np.zeros(9)
prev_tendon_data = np.zeros(9)
cur_joint_data = np.zeros(6)
prev_joint_data = np.zeros(6)

# Accessory functions 
def arduino_map(val, inMin, inMax, outMin, outMax):
    return int((val-inMin)*(outMax-outMin)/(inMax-inMin)+outMin)

# Callback functions    
def state_callback(data):
    incomingString = str(data.data)
    global state
#    print("Incoming command: " + incomingString)
    
    if (incomingString == "move_to_pose"):
        state = MOVE_TO_POSE
        print("Switching state to MOVE_TO_POSE")
    elif (incomingString == "stop"):
        state = STOPPED
        print("Switching state to STOPPED")
    elif (incomingString == "grasp"):
        state = BLIND_GRASPING
        print("Switching state to BLIND_GRASPING")
        
# TODO: Debugging
def tendon_sns_callback(data):
    # Bump old data to prev variable
    global prev_tendon_data, cur_tendon_data
    prev_tendon_data = cur_tendon_data
    # Fill cur_tendon_data with updated data
    for i in range(9):
        cur_tendon_data[i] = data[i]

# TODO: Debugging
def joint_sns_callback(data):
    # Bump old data to prev variable
    global prev_joint_data, cur_joint_data
    prev_joint_data = cur_joint_data
    # Fill cur_tendon_data with updated data
    for i in range(9):
        cur_joint_data[i] = data[i]
    
# Main loop
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_serial_interface', anonymous=True)
    
    # Setup subscription to cmd_motor_controller topic
    rospy.Subscriber("master_state", String, state_callback)
    rospy.Subscriber("finger_tendon_sensors", String, tendon_sns_callback)
    rospy.Subscriber("finger_joint_sensors", Sensor_Fast, joint_sns_callback)
    global cmdPub
    cmdPub = rospy.Publisher('motor_cmd', String, queue_size=10)
    
    # Set loop speed
    rate = rospy.Rate(50) #100hz???
    
    # Output that things are going
    print("Running motor_controller node.")
    
    while not rospy.is_shutdown():  
        # Internal state machine
        if (state == STOPPED): 
            cmdPub.publish(stop_motor_string)
            cur_motor_string = stop_motor_string
        elif (state == MOVE_TO_POSE):
            # TODO: Position controller?
            x = 1
        elif (state == BLIND_GRASPING):
            # TODO: lose grasping tendons blindly
            # TODO: Open hyperextension tendons for just a little bit
            x = 1
            
        print(cur_motor_string)
        cmdPub.publish(cur_motor_string)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    