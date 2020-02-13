#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
import time

verbose = True

def motor_controller():
    
    # Setup node
    rospy.init_node('motor_controller', anonymous=True)
    
    # Make serial connection to arduino
    com = serial.Serial('/dev/ttyACM0',baudrate=115200)
    time.sleep(1.2)
    
    # Test connection by sending and reading a message
#    setupMessage = bytes('Serial Connected', 'utf-8')
#    com.write(setupMessage)
#    time.sleep(0.1)
#    rospy.loginfo(com.read_all().decode('ascii'))
       
#    pub = rospy.Publisher('motor_commands', String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():

        inString = com.read_all().decode('ascii')  #.decode('utf-8')
        print(inString)
        time.sleep(.5)
        
        if verbose:
            tempString = input('Enter pwm value (0-99): ')
            message = bytes(tempString, 'utf-8')
            com.write(message)
#            time.sleep(0.5)
#            inString = com.read_all().decode('ascii')  #.decode('utf-8')
#            rospy.loginfo(inString)
        
#        rate.sleep()

if __name__ == '__main__':
    try:
        motor_controller()
    except rospy.ROSInterruptException:
        pass
    
'''
import serial
import time
com = serial.Serial('/dev/ttyACM0',baudrate=9600)

while True:    
    message = bytes('test', 'utf-8')
    com.write(message)
    time.sleep(0.01)
    inString = com.read_all().decode('ascii')  #.decode('utf-8')
    print(inString)

com.close()
'''