#!/usr/bin/env python
# license removed for brevity

# Imports
import rospy
from std_msgs.msg import String

# Setup global variables
state_string = "manual_input"

def master_state_machine():
    
    # Set up publisher to master_state topic
    pub_master_state = rospy.Publisher('master_state', String, queue_size=10)
    
    # State node at 10hz (speed should be flexible)
    rospy.init_node('master_state_machine', anonymous=True)
#    rate = rospy.Rate(10) # 10hz
    
    # Enter main control loop (this is blocking based on user input right now)
    while not rospy.is_shutdown():
        # Display control options
        print('Enter a Command:')
        print('[space] = stop all motors (and enter manual_input mode)')
        print('[1] = drive motors by pressing sensors')
        print('[2] = unclear at this stage, but can add more as we see fit')
        input_string = raw_input('Input: ')
        
        # Handle input and publish appropriate state
        if (input_string == ' '):
            state_string = "manual_input"
            pub_master_state.publish(state_string)
        elif (input_string == '1'):
            state_string = "drive_hand"
            pub_master_state.publish(state_string)
        elif (input_string == '2'):
            state_string = "manual_input"
            pub_master_state.publish(state_string)
        
        # Sleep to match control loop frequency (shouldn't be necessary with manual input)
#        rate.sleep()

if __name__ == '__main__':
    try:
        master_state_machine()
    except rospy.ROSInterruptException:
        pass