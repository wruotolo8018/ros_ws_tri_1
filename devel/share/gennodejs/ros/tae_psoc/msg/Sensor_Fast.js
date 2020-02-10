// Auto-generated. Do not edit!

// (in-package tae_psoc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sensor_Fast {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sns_1_Fast = null;
      this.sns_2_Fast = null;
      this.sns_3_Fast = null;
    }
    else {
      if (initObj.hasOwnProperty('sns_1_Fast')) {
        this.sns_1_Fast = initObj.sns_1_Fast
      }
      else {
        this.sns_1_Fast = [];
      }
      if (initObj.hasOwnProperty('sns_2_Fast')) {
        this.sns_2_Fast = initObj.sns_2_Fast
      }
      else {
        this.sns_2_Fast = [];
      }
      if (initObj.hasOwnProperty('sns_3_Fast')) {
        this.sns_3_Fast = initObj.sns_3_Fast
      }
      else {
        this.sns_3_Fast = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sensor_Fast
    // Serialize message field [sns_1_Fast]
    bufferOffset = _arraySerializer.int16(obj.sns_1_Fast, buffer, bufferOffset, null);
    // Serialize message field [sns_2_Fast]
    bufferOffset = _arraySerializer.int16(obj.sns_2_Fast, buffer, bufferOffset, null);
    // Serialize message field [sns_3_Fast]
    bufferOffset = _arraySerializer.int16(obj.sns_3_Fast, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sensor_Fast
    let len;
    let data = new Sensor_Fast(null);
    // Deserialize message field [sns_1_Fast]
    data.sns_1_Fast = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_Fast]
    data.sns_2_Fast = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_3_Fast]
    data.sns_3_Fast = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.sns_1_Fast.length;
    length += 2 * object.sns_2_Fast.length;
    length += 2 * object.sns_3_Fast.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tae_psoc/Sensor_Fast';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '37b8e6d7402e8a51053039e4e2fc0b2c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16[] sns_1_Fast
    int16[] sns_2_Fast
    int16[] sns_3_Fast
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sensor_Fast(null);
    if (msg.sns_1_Fast !== undefined) {
      resolved.sns_1_Fast = msg.sns_1_Fast;
    }
    else {
      resolved.sns_1_Fast = []
    }

    if (msg.sns_2_Fast !== undefined) {
      resolved.sns_2_Fast = msg.sns_2_Fast;
    }
    else {
      resolved.sns_2_Fast = []
    }

    if (msg.sns_3_Fast !== undefined) {
      resolved.sns_3_Fast = msg.sns_3_Fast;
    }
    else {
      resolved.sns_3_Fast = []
    }

    return resolved;
    }
};

module.exports = Sensor_Fast;
