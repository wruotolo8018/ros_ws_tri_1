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
MANUAL_INPUT = 0
DRIVE_HAND = 1
state = MANUAL_INPUT

# Manual state variables
manual_motor_string = "505050505050505050"

# Drive hand state variables
sensor_1_vector = np.zeros(4)
sensor_2_vector = np.zeros(4)
sensor_3_vector = np.zeros(4)
drive_motor_string = "505050505050505050"

# Accessory functions 
def arduino_map(val, inMin, inMax, outMin, outMax):
    return int((val-inMin)*(outMax-outMin)/(inMax-inMin)+outMin)

# Callback functions    
def state_callback(data):
    incomingString = str(data.data)
    global state
#    print("Incoming command: " + incomingString)
    
    if (incomingString == "drive_hand"):
        state = DRIVE_HAND
        print("Switching state to DRIVE_HAND")
    elif (incomingString == "manual_input"):
        state = MANUAL_INPUT
        print("Switching state to MANUAL_INPUT")
        
def fast_sensor_callback(data):
#    incomingData = data.data
    if (state == DRIVE_HAND):
        # Read in Sensor_Fast data and set variables to use in main loop
        global sensor_1_vector, sensor_2_vector, sensor_3_vector
        sensor_1_vector = np.asarray(data.sns_1_Fast)
        sensor_2_vector = np.asarray(data.sns_2_Fast)
        sensor_3_vector = np.asarray(data.sns_3_Fast)
        
def manual_callback(data):
    incomingString = str(data.data)
    global manual_motor_string
    manual_motor_string = incomingString
    print("Incoming manual command: " + incomingString)
    
# Main loop
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_controller', anonymous=True)
    
    # Setup subscription to cmd_motor_controller topic
    rospy.Subscriber("master_state", String, state_callback)
    rospy.Subscriber("manual_motor_commands", String, manual_callback)
    rospy.Subscriber("Sensor_Fast", Sensor_Fast, fast_sensor_callback)
    global cmdPub
    cmdPub = rospy.Publisher('cmd_motor_controller', String, queue_size=10)
    
    # Set loop speed
    rate = rospy.Rate(100) #100hz???
    
    # Output that things are going
    print("Running motor_controller node.")
    
    while not rospy.is_shutdown():  
        # Internal state machine
        if (state == MANUAL_INPUT): 
            com.write(manual_motor_string)
        if (state == DRIVE_HAND):
            # Map sensor vectors to motor commands
            pwmArray = np.zeros(9)
            sns1_avg_r = np.average(sensor_1_vector[2:3])
            sns1_avg_l = np.average(sensor_1_vector[1:2])
            if (sns1_avg_l > sns1_avg_r):
                pwmArray[0] = arduino_map(sns1_avg_l, 0, 2048, 50, 75)
                pwmArray[1] = 50 #arduino_map(sns1_avg_l, 0, 2048, 50, 75)
                pwmArray[2] = arduino_map(sns1_avg_l, 0, 2048, 50, 0)
            else:
                pwmArray[0] = arduino_map(sns1_avg_r, 0, 2048, 50, 0)
                pwmArray[1] = 50 #arduino_map(sns1_avg_r, 0, 2048, 50, 0)
                pwmArray[2] = arduino_map(sns1_avg_r, 0, 2048, 50, 75)
                
            sns2_avg_r = np.average(sensor_2_vector[2:3])
            sns2_avg_l = np.average(sensor_2_vector[1:2])
            if (sns2_avg_l > sns2_avg_r):
                pwmArray[3] = 50 #arduino_map(sns2_avg_l, 0, 2048, 50, 75)
                pwmArray[4] = arduino_map(sns2_avg_l, 0, 2048, 50, 75)
                pwmArray[5] = 50 #arduino_map(sns2_avg_l, 0, 2048, 50, 0)
            else:
                pwmArray[3] = 50 #arduino_map(sns2_avg_r, 0, 2048, 50, 0)
                pwmArray[4] = arduino_map(sns2_avg_r, 0, 2048, 50, 0)
                pwmArray[5] = 50 #arduino_map(sns2_avg_r, 0, 2048, 50, 75)
                
            sns3_avg_r = np.average(sensor_3_vector[2:3])
            sns3_avg_l = np.average(sensor_3_vector[1:2])
            if (sns3_avg_l > sns3_avg_r):
                pwmArray[6] = arduino_map(sns3_avg_l, 0, 2048, 50, 75)
                pwmArray[7] = 50 #arduino_map(sns3_avg_l, 0, 2048, 50, 75)
                pwmArray[8] = arduino_map(sns3_avg_l, 0, 2048, 50, 0)
            else:
                pwmArray[6] = arduino_map(sns3_avg_r, 0, 2048, 50, 0)
                pwmArray[7] = 50 #arduino_map(sns3_avg_r, 0, 2048, 50, 0)
                pwmArray[8] = arduino_map(sns3_avg_r, 0, 2048, 50, 75)
            
            drive_motor_string = ""
            
            for i in range(0,9):
                if (pwmArray[i] < 10):
                    pwmString = "0" + str(int(pwmArray[i]));
                else:
                    pwmString = str(int(pwmArray[i]))
                drive_motor_string += pwmString
                
            print(drive_motor_string)
            com.write(drive_motor_string)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        # Setup serial connection
        com = serial.Serial('/dev/ttyACM0',baudrate=115200)
        time.sleep(0.5) # Not sure this is necessary but seems to stabilize comms some
        
        # Start controller node
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    