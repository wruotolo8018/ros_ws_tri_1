#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
import serial
import time

def motor_talker():
    
    # Publish current motor commands
    pub = rospy.Publisher('motor_commands', String, queue_size=10)
    rospy.init_node('motor_talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        hello_str = "Send command: alfdjalskd %s" % rospy.get_time()
        rospy.loginfo(hello_str)
        pub.publish(hello_str)
        rate.sleep()

if __name__ == '__main__':
    try:
        motor_talker()
    except rospy.ROSInterruptException:
        pass