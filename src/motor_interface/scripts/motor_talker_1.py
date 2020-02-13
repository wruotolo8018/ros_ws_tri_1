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
        cmd_string = input("Input Command to this line: ")
        rospy.loginfo(cmd_string)
        pub.publish(cmd_string)
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_talker()
    except rospy.ROSInterruptException:
        pass