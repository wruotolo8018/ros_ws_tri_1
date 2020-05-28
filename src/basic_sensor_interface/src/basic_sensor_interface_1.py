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
cur_tendon_data = tendon_sns()
cur_joint_data = joint_sns()

# Sensor calibration variables
low_vals = []
high_vals = []
calibrated_vals = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

# Accessory functions 
def arduino_map(val, inMin, inMax, outMin, outMax):
    return int((val-inMin)*(outMax-outMin)/(inMax-inMin)+outMin)
def get_calibration_values():
    global low_vals, high_vals
    low_vals = [1023, 950, 625, 0, 0, 0, 0, 0, 0, 550, 700, 0, 0, 0, 0]
    high_vals = [550, 650, 1000, 1023, 1023, 1023, 1023, 1023, 1023, 850, 1023, 1023, 1023, 1023, 1023]
    
# Callback Functions
def state_callback(data):
    incomingString = str(data.data)
    global state
    
# Main node
def basic_sensor_serial():
    # Setup node
    rospy.init_node('basic_sensor_serial', anonymous=True)
    
    # Setup subscription to state machine
    rospy.Subscriber("master_state", String, state_callback)
    
    # Setup publishers to pertinent data streams
    global tendon_sns_pub
    tendon_sns_pub = rospy.Publisher('finger_tendon_sensors', tendon_sns, queue_size=10)
    global joint_sns_pub
    joint_sns_pub = rospy.Publisher('finger_joint_sensors', joint_sns, queue_size=10)
    
    # Set loop speed
    rate = rospy.Rate(50) #100hz???
    
    # Set calibration values
    get_calibration_values()
    
    # Output that things are going
    print("Basic interface with finger sensors running.")
    
    while not rospy.is_shutdown():  
        if state == ACTIVE:
            # read serial interface for current data
            read_string = com.read_until()
            print(read_string)
            
            # populate message fields appropriately
            split_read_string = read_string.split('_')
            if (len(split_read_string) > 14): 
                global low_vals, high_vals
                for i in range(15):
#                    print(split_read_string[i])
                    calibrated_vals[i] = arduino_map(int(split_read_string[i]), low_vals[i], high_vals[i], 0, 100)
                print(calibrated_vals)
                cur_tendon_data.prox1 = calibrated_vals[0]
                cur_tendon_data.dist1 = calibrated_vals[1]
                cur_tendon_data.hype1 = calibrated_vals[2]
                cur_tendon_data.prox2 = calibrated_vals[3]
                cur_tendon_data.dist2 = calibrated_vals[4]
                cur_tendon_data.hype2 = calibrated_vals[5]
                cur_tendon_data.prox3 = calibrated_vals[6]
                cur_tendon_data.dist3 = calibrated_vals[7]
                cur_tendon_data.hype3 = calibrated_vals[8]
                
                cur_joint_data.prox1 = calibrated_vals[9]
                cur_joint_data.dist1 = calibrated_vals[10]
                cur_joint_data.prox2 = calibrated_vals[11]
                cur_joint_data.dist2 = calibrated_vals[12]
                cur_joint_data.prox3 = calibrated_vals[13]
                cur_joint_data.dist3 = calibrated_vals[14]
                
            
            # publish sensor data
            tendon_sns_pub.publish(cur_tendon_data)
            joint_sns_pub.publish(cur_joint_data)
            
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
    