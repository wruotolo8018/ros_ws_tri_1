#!/usr/bin/env python
# license removed for brevity

# Imports
import rospy
from std_msgs.msg import String
import serial
import time
import numpy as np
# Suspect code below
from basic_sensor_interface.msg import tendon_sns
from basic_sensor_interface.msg import joint_sns

# state definitions
ACTIVE = 1
DEACTIVATED = 0
state = ACTIVE

# messages to rewrite? unsure if this saves time
cur_tendon_data = tendon_sns
cur_joint_data = joint_sns

def state_callback(data):
    incomingString = str(data.data)
    global state
    
def basic_sensor_serial():
    # Setup node
    rospy.init_node('basic_sensor_serial', anonymous=True)
    
    # Setup subscription to state machine
    rospy.Subscriber("master_state", String, state_callback)
    global tendon_sns_pub
    tendon_sns_pub = rospy.Publisher('finger_tendon_sensors', tendon_sns, queue_size=10)
    global joint_sns_pub
    joint_sns_pub = rospy.Publisher('finger_joint_sensors', joint_sns, queue_size=10)
    
    # Set loop speed
    rate = rospy.Rate(50) #100hz???
    
    # Output that things are going
    print("Basic interface with finger sensors running.")
    
    while not rospy.is_shutdown():  
        if state == ACTIVE:
            # read serial interface for current data
            read_string = com.read_until()
            print(read_string)
            
            # populate message fields appropriately
            
            
            # publish sensor data
            sensorData = 1
        elif state == DEACTIVATED:
            # do nothing
            sensorData = 0
            
        rate.sleep()

if __name__ == '__main__':
    try:
        # Setup serial connection
        com = serial.Serial('/dev/ttyACM0',baudrate=115200)
        time.sleep(0.5) # Not sure this is necessary but seems to stabilize comms some
        
        # Start controller node
        basic_sensor_serial()
    except rospy.ROSInterruptException:
        pass
    