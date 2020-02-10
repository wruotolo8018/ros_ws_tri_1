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
    com = serial.Serial('/dev/ttyACM0',baudrate=9600)
    time.sleep(1.2)
    
    # Test connection by sending and reading a message
#    setupMessage = bytes('Serial Connected', 'utf-8')
#    com.write(setupMessage)
#    time.sleep(0.1)
#    rospy.loginfo(com.read_all().decode('ascii'))
       
#    pub = rospy.Publisher('motor_commands', String, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        
#        message = bytes('80', 'utf-8')
#        com.write(message)
#        time.sleep(1.0)
#        message = bytes('80', 'utf-8')

        if verbose:
#            time.sleep(2.0)
            tempString = input('Enter pwm value (0-99): ')
            message = bytes(tempString, 'utf-8')
            com.write(message)
#            time.sleep(2.0)
#            inString = com.read_all().decode('ascii')  #.decode('utf-8')
#            rospy.loginfo(inString)
        
#        rate.sleep()
        
#        
#        hello_str = "Send command: alfdjalskd %s" % rospy.get_time()
#        rospy.loginfo(hello_str)
#        pub.publish(hello_str)
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