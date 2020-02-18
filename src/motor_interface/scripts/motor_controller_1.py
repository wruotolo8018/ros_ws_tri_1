#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
import time
import numpy as np

from tae_psoc.msg import SensorPacket
from tae_psoc.msg import cmdToPsoc
from tae_psoc.msg import Sensor_Fast
from tae_psoc.msg import Sensor_Indiv

verbose = True

# mode definitions
MANUAL_INPUT = 0
FEEDBACK_MODE = 1
mode = MANUAL_INPUT

cmdPub = 0
    
def arduino_map(val, inMin, inMax, outMin, outMax):
    return int((val-inMin)*(outMax-outMin)/(inMax-inMin)+outMin)
    
def cmd_callback(data):
    incomingString = str(data.data)
    global mode
    print("Incoming data: " + incomingString)
#    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    # TODO: send new command to serial ouput
    if (incomingString == "read_all"):
        mode = MANUAL_INPUT
        try:
            readString = com.read_all() #.decode('ascii')
            print("Reading from arduino: ")
            print(readString)
        except:
            print("Read All Exception (WR)")
    elif (incomingString == "read_sensors"):
        mode = FEEDBACK_MODE
    else:
#        mode = MANUAL_INPUT
#        write_to_com(incomingString)
#        incomingString.encode('utf-8')
        print(incomingString)
#        message = bytes(incomingString)
        com.write(incomingString)
#        time.sleep(0.1)
        
def process_sensor_data(data):
#    incomingData = data.data
    if (mode == FEEDBACK_MODE):
        sensor_1_vector = np.asarray(data.sns_1_Fast)
        motorValue = np.average(sensor_1_vector)
#        print(motorValue)
        pwmInt = arduino_map(motorValue, 0, 2048, 0, 99)
        print(pwmInt)
        if (pwmInt < 10):
            pwmString = "0" + str(pwmInt)
        else:
            pwmString = str(pwmInt)
        motorString = "50505050"+ pwmString + "50505050"
        global cmdPub
        cmdPub.publish(motorString)
#        time.sleep(0.1)
    
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_controller', anonymous=True)
    
    # Setup subscription to manual_motor_commands topic
    rospy.Subscriber("manual_motor_commands", String, cmd_callback)
    rospy.Subscriber("Sensor_Fast", Sensor_Fast, process_sensor_data)
    global cmdPub
    cmdPub = rospy.Publisher('manual_motor_commands', String, queue_size=10)
    
    
    # Set loop speed??? 
    rate = rospy.Rate(100) # 10hz
    
    print("Running motor_controller node.")
    
    while not rospy.is_shutdown():        
        rate.sleep()

if __name__ == '__main__':
    try:
        # Setup serial connection
        com = serial.Serial('/dev/ttyACM1',baudrate=115200)
        time.sleep(1.0) # Not sure this is necessary but seems to stabilize comms some
        
        # Start controller node
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    