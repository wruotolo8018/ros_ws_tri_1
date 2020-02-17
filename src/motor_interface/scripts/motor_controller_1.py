#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
import time

verbose = True
#com = serial.Serial('/dev/ttyACM0',baudrate=115200)

def write_to_com(message):
    message = bytes(message, 'utf-8')
    com.write(message)
    
def callback(data):
    incomingString = str(data.data)
    print("Incoming data: " + incomingString)
#    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    # TODO: send new command to serial ouput
    if (incomingString == "read_all"):
        try:
            readString = com.read_all() #.decode('ascii')
            print("Reading from arduino: ")
            print(readString)
        except:
            print("Read All Exception (WR)")
    else:
#        write_to_com(incomingString)
#        incomingString.encode('utf-8')
        print(incomingString)
#        message = bytes(incomingString)
        com.write(incomingString)
        time.sleep(0.1)
    
def motor_controller():
    
    # Setup node
    rospy.init_node('motor_controller', anonymous=True)
    
    # Setup subscription to manual_motor_commands topic
    rospy.Subscriber("manual_motor_commands", String, callback)
    
    # Set loop speed??? 
    rate = rospy.Rate(10) # 10hz
    
    while not rospy.is_shutdown():

#        try:
#            inString = com.read_all().decode('ascii')  #.decode('utf-8')
#            print(inString)
#        except:
#            print("It's all fucked")
#            
#        time.sleep(.5)
#        
#        if verbose:
##            tempString = input('Enter pwm value (0-99): ')
#            tempString = "1234567887654321"
#            message = bytes(tempString, 'utf-8')
#            com.write(message)
##            time.sleep(0.5)
##            inString = com.read_all().decode('ascii')  #.decode('utf-8')
##            rospy.loginfo(inString)
        
        
        rate.sleep()

if __name__ == '__main__':
    try:
        # Setup serial connection
        com = serial.Serial('/dev/ttyACM0',baudrate=115200)
        time.sleep(1.0) # Not sure this is necessary but seems to stabilize comms some
        
        # Start controller node
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
    