#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
import time

def motor_talker():
    
    # Publish current motor commands
    pub = rospy.Publisher('manual_motor_commands', String, queue_size=10)
    rospy.init_node('motor_talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        cmd_string = raw_input('Enter a Command (space=stop_all, r=read_all, 1=all1s, 9=all9s, custom=whatever)\nInput: ')
        if (cmd_string == ' '):
            cmd_string = "505050505050505050"
        elif (cmd_string == '1'):
            cmd_string = "111111111111111111"
        elif (cmd_string == "r"):
            cmd_string = "read_all"
        elif(cmd_string == "9"):
            cmd_string = "999999999999999999"
        print(cmd_string)
        pub.publish(cmd_string)
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_talker()
    except rospy.ROSInterruptException:
        pass