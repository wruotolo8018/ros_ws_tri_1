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
        print('Enter a Command (space=stop_all, r=read_all, s=read_sensors, 1=all1s, 9=all9s, custom=whatever)')
        cmd_string = raw_input('Input: ')
        if (cmd_string == ' '):
            cmd_string = "505050505050505050"
        elif (cmd_string == 'c'):
            cmd_string = "505050505040505050"
        elif (cmd_string == 'o'):
            cmd_string = "505050505060505050"
        print(cmd_string)
        pub.publish(cmd_string)
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_talker()
    except rospy.ROSInterruptException:
        pass