#!/usr/bin/env python
import rospy
import time
import psocScanner as psoc
import struct
import numpy as np
import os, sys
import math
import scipy.fftpack
import datetime
from scipy.io import loadmat
from scipy.io import savemat
import matplotlib.pyplot as plt

from tae_psoc.msg import SensorPacket
from tae_psoc.msg import cmdToPsoc
from tae_psoc.msg import Sensor_Fast
from tae_psoc.msg import Sensor_Indiv

IDLE = 0
STREAMING = 1
NO_CMD = 0
START_CMD = 2
IDLE_CMD = 3
currState = IDLE
CMD_in = NO_CMD
UR5_Y_pos = 0 # in mm

def callback(data):
    global CMD_in
    CMD_in = data.cmdInput

def mainLoop():
    print("Got to MAIN LOOP")
    global currState
    global CMD_in   
    global gripperPosInput
    global UR5_Y_pos

    # Start node
    rospy.init_node('psocPubSub_WilsonHand')
    
    # Subscribe to cmdToPsoc which controls start and stop of the sensor reading
    # TODO: make this change mode? 
    rospy.Subscriber('cmdToPsoc',cmdToPsoc, callback)
        
    # Publish to sensor topic depending on mode
    pub_Fast = rospy.Publisher('Sensor_Fast', Sensor_Fast, queue_size=1)
    pub_Indiv = rospy.Publisher('Sensor_Indiv', Sensor_Indiv, queue_size=1)
    msg_Fast = Sensor_Fast()
    msg_Indiv = Sensor_Indiv() 
    
    # Old tae data saving stuff
#    ResultSavingDirectory = '/home/tae/Data'
#    SavingFileName = savingFileName  #'test_box'
    
    counter = 0
    SensorExist = 1
    plotShow = 1
    SensorNum = 3
    SensorAddress = np.array([8, 9, 10])

    MODE_ONE_PAD = 0 
    MODE_FOUR_PAD = 1
    MODE_NINE_PAD = 2
    MODE_INDIVIDUAL = 3
    MODE_CAPSENSE = 17
    MODE_ONE_AND_FOUR =32   #Problematic  at 1kHz
    MODE_NINE_AND_INDIV= 33 
    MODE_ONE_AND_NINE = 34  #Problematic
    MODE_FOUR_AND_INDIV = 35; # 250
    MODE_TORSION_AND_INDIV = 36; #0X24

    #################################3# Sensing MODE Select@!!!1 @#####################################
    # sensingMode = MODE_FOUR_AND_INDIV
    sensingMode = MODE_TORSION_AND_INDIV

    slopeCompensateOn = True

    IsTwoModeMerged = False
    if sensingMode == MODE_ONE_PAD:
        SamplingFreq = 1.5e3
    elif sensingMode == MODE_FOUR_PAD:
        SamplingFreq = 300; 
    elif sensingMode == MODE_NINE_PAD:
        SamplingFreq = 150
    elif sensingMode == MODE_INDIVIDUAL:
        SamplingFreq = 60
    elif sensingMode == MODE_ONE_AND_FOUR:
        SamplingFreq = 1e3
        num_sensors_2 = 4
        IsTwoModeMerged = True
    elif sensingMode == MODE_ONE_AND_NINE:
        SamplingFreq = 1e3
        num_sensors_2 = 9
        IsTwoModeMerged = True
    elif sensingMode == MODE_NINE_AND_INDIV:
        SamplingFreq = 110
        num_sensors_2 = 36
        IsTwoModeMerged = True
    elif sensingMode == MODE_FOUR_AND_INDIV or sensingMode == MODE_TORSION_AND_INDIV:        
#        SamplingFreq = 5# For now let's keep it 250, it was 300
        SamplingFreq = 250 # For now let's keep it 250, it was 300
        num_sensors_2 = 36
        IsTwoModeMerged = True

    SamplingPeriod = 1.0/SamplingFreq
    KitprogTimerClockFreq = 100e3
    tempPeriodInput = divmod(math.floor(SamplingPeriod * KitprogTimerClockFreq) , 2**8)
    periodInput = np.array([tempPeriodInput[1], tempPeriodInput[0]])

    #%% We loop
    while not rospy.is_shutdown():
        if currState == IDLE and CMD_in == START_CMD:
            print("LOOPING\n")
            CMD_in = NO_CMD
            currState = STREAMING
            currDateTimeString = datetime.datetime.now().strftime("%y%m%d_%H%M%S_")
            
            # Keep in case we want to save data later
        #    output_file = ResultSavingDirectory + '\\'+ 'result_' +currDateString + SavingFileName + '.html'

            # TODO: allocate serial ports how we want them with motors and sensors
            ts = psoc.TactileSensor(port="/dev/ttyACM0")
            ts.ser.flushInput()

            # Assigning the Number of Sensor and Address
            thisInputArray = np.append(np.append(ord('a'), SensorNum), SensorAddress)
            ts.sendNum(thisInputArray)    
            time.sleep(0.1)
            
            #Set Period of Sampling
            thisInputArray = np.array([ord('p'), periodInput[0], periodInput[1]])
            ts.sendNum(thisInputArray)        
            time.sleep(0.1)
            
            # Select Sensing Mode
            thisInputArray = np.array([ord('m'), sensingMode])    
            ts.sendNum(thisInputArray)
            time.sleep(0.1)
            
            # Query the Data Length
            ts.sendChar("q")
            time.sleep(0.1)
            
            ts.packet_size = ord(ts.ser.read(1))-1
            num_sensors_1= int((ts.packet_size - 1) / 2)    
            ts.num_sensors= int((ts.packet_size - 1) / 2)
            ts.unpackFormat = '<'
            for i in range(0,ts.packet_size):
                ts.unpackFormat = ts.unpackFormat + 'B'
                
            if IsTwoModeMerged: #% Deal with Merging Techniq
                num_sensors_1 = int(num_sensors_1/2)
                print(ts.packet_size)
                sensorIndexInData_1 = list(range(int(num_sensors_1),int((ts.packet_size - 1) / 2)) )  # Last Half is the Fast Mode
                sensorIndexInData_2 = list(range(0, int(num_sensors_1)))    # First Half is the Indiv Mod
                
                groupIndexMax = num_sensors_2/ num_sensors_1 -1; #% Follows C convention
                
            else:
                num_sensors_2 = 0   # % Dummy
            
            print("num_sensor 1=")
            print(num_sensors_1)
            print("num_sensor 2=")
            print(num_sensors_2)
            
            # Get Initial samples for measuring Offset Values    
            initialSamplingNum = 16 # it should be an even number
            
            #%% Buffer
            init_BufferSize = 5000;

            sensor_data_history_Fast = np.zeros((init_BufferSize,num_sensors_1, SensorNum), dtype = 'i')
            sensor_data_history_Indiv = np.zeros((init_BufferSize,num_sensors_2, SensorNum), dtype = 'i')

            sensor_offset_Fast = np.zeros((1, num_sensors_1, SensorNum), dtype = 'i')
            sensor_offset_Indiv = np.zeros((1, num_sensors_2, SensorNum), dtype = 'i')

            readCountArray = np.zeros((SensorNum, 2), dtype = 'i') # 2 is for Fast , Indiv Mode.
            sensor_offsetObtained = False

            #%%
            tic = time.time()
            stopCMDsent = False
            snsIndex = 0   

            #Start Streaming
            ts.sendChar("s")

            currDateOnlyString = datetime.datetime.now().strftime("%y%m%d")

            # Loop for getting sensor readings
            while not CMD_in == IDLE_CMD:

                #while ord(ts.ser.read(1)) != ts.STX:
                while True:
                    firstByte = ord(ts.ser.read(1))
                    if firstByte % 16 == ts.STX:  # Changed for Address Info coupling
                       thisAddress = math.floor(firstByte / 16)
                       thisSensorIdx = np.where(SensorAddress == thisAddress)[0]
                       if thisSensorIdx.size == 1:
                           thisSensorIdx = thisSensorIdx[0]
                           break


                #Read rest of the data
                tempSampledData = ts.readRestData()       

                if IsTwoModeMerged:
                    #Fast Mode
                    sensor_data_history_Fast[readCountArray[thisSensorIdx,0], :, thisSensorIdx] = tempSampledData[0,sensorIndexInData_1] - sensor_offset_Fast[0,:,thisSensorIdx]
                    readCountArray[thisSensorIdx,0] += 1

                    # Indiv Mode
                    groupIndex = int(ts.groupIndex)

                    sensor_data_history_Indiv[readCountArray[thisSensorIdx,1], groupIndex*int(num_sensors_1):(groupIndex+1)*int(num_sensors_1), thisSensorIdx]= tempSampledData[0,sensorIndexInData_2]
                    if groupIndex == groupIndexMax:
                        sensor_data_history_Indiv[readCountArray[thisSensorIdx,1],:,thisSensorIdx] = sensor_data_history_Indiv[readCountArray[thisSensorIdx,1],:,thisSensorIdx] - sensor_offset_Indiv[0,:,thisSensorIdx]
                        readCountArray[thisSensorIdx,1] += 1

                    if sensor_offsetObtained and thisSensorIdx == SensorNum-1:
                        #Make the Fast Message
                        msg_Fast.sns_1_Fast = sensor_data_history_Fast[readCountArray[0,0]-1,:,0]
                        if SensorNum >= 2:
                            msg_Fast.sns_2_Fast = sensor_data_history_Fast[readCountArray[1,0]-1,:,1]
                            if SensorNum==3:
                                msg_Fast.sns_3_Fast = sensor_data_history_Fast[readCountArray[2,0]-1,:,2]
                        pub_Fast.publish(msg_Fast)

                        # Make the Indiv Message
                        if groupIndex == groupIndexMax:
                            #Make the Fast Message
                            msg_Indiv.sns_1_Indiv = sensor_data_history_Indiv[readCountArray[0,1]-1,:,0]
                            if SensorNum >= 2:
                                msg_Indiv.sns_2_Indiv = sensor_data_history_Indiv[readCountArray[1,1]-1,:,1]
                                if SensorNum==3:
                                    msg_Indiv.sns_3_Indiv = sensor_data_history_Indiv[readCountArray[2,1]-1,:,2]

                            pub_Indiv.publish(msg_Indiv)

                    # Obtain Offset from initial few samples
                    if not sensor_offsetObtained and  readCountArray[SensorNum-1,1] == initialSamplingNum:
                        for i in range(0,SensorNum):
                            sensor_offset_Fast[0,:,i] = np.mean(sensor_data_history_Fast[readCountArray[i,0]-initialSamplingNum:readCountArray[i,0],:,i],axis=0, dtype = 'i')
                            sensor_offset_Indiv[0,:,i] = np.mean(sensor_data_history_Indiv[5:readCountArray[i,1],:,i],axis=0, dtype = 'i')
                            sensor_offsetObtained = True

                    #if the data overflows
                    if readCountArray[SensorNum-1,0] > sensor_data_history_Fast.shape[0]-1:
                        print("OverFlow")
                        sensor_data_history_Fast = np.append(sensor_data_history_Fast, np.zeros((init_BufferSize,num_sensors_1, SensorNum), dtype = 'i'), axis = 0 )

                    if readCountArray[SensorNum-1,1] > sensor_data_history_Indiv.shape[0]-1:
                        sensor_data_history_Indiv = np.append(sensor_data_history_Indiv, np.zeros((init_BufferSize,num_sensors_2, SensorNum), dtype = 'i'), axis = 0 )


                ###############################################3

            ts.sendChar("i")

            if IsTwoModeMerged:

                sensor_data_history_Fast = sensor_data_history_Fast[0:readCountArray[SensorNum-1,0], :, :]
                sensor_data_history_Indiv = sensor_data_history_Indiv[0:readCountArray[SensorNum-1,1], :, :]


            
            ts.closePort()
            

            
            if plotShow:
                #%% Plot the data

                fig, axs = plt.subplots(SensorNum)
                axs[0].set_title('Fast Mode')
                for i in range(0,SensorNum):
                    axs[i].plot(sensor_data_history_Fast[:,:,i])

                fig1, axs1 = plt.subplots(SensorNum)
                axs1[0].set_title('Indiv Mode')
                for i in range(0,SensorNum):
                    axs1[i].plot(sensor_data_history_Indiv[:,:,i])


                plt.show()
                


            #%% Save Output
            
            
#            directory = ResultSavingDirectory +'/' + currDateOnlyString
#            if not os.path.exists(directory):
#            	os.makedirs(directory)
#
#            
#            output_file = directory + '/'+ 'result_' +currDateTimeString + SavingFileName + '.mat'
#            	
#            # # currDateString = datetime.datetime.now().strftime("%y%m%d_%H%M%S_")
#            # output_file = ResultSavingDirectory + '/'+ 'result_' +currDateString + SavingFileName + '.csv'
#            
#
#            # Save as .mat file
#            savemat(output_file, 
#                {'sensor_data_history_Fast':sensor_data_history_Fast,
#                 'sensor_data_history_Indiv':sensor_data_history_Indiv,
#                  'sensingMode' : sensingMode,                  
#                  })
#
#            # np.savetxt(output_file, sensor_1_data_history_second, delimiter=",")
#            print("file Saved")

            CMD_in = NO_CMD
            currState = IDLE







                
if __name__ == '__main__':
    try:
        print("Started!")
        mainLoop()
    except rospy.ROSInterruptException: pass








