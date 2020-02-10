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

class Sensor_Indiv {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sns_1_Indiv = null;
      this.sns_2_Indiv = null;
      this.sns_3_Indiv = null;
    }
    else {
      if (initObj.hasOwnProperty('sns_1_Indiv')) {
        this.sns_1_Indiv = initObj.sns_1_Indiv
      }
      else {
        this.sns_1_Indiv = [];
      }
      if (initObj.hasOwnProperty('sns_2_Indiv')) {
        this.sns_2_Indiv = initObj.sns_2_Indiv
      }
      else {
        this.sns_2_Indiv = [];
      }
      if (initObj.hasOwnProperty('sns_3_Indiv')) {
        this.sns_3_Indiv = initObj.sns_3_Indiv
      }
      else {
        this.sns_3_Indiv = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sensor_Indiv
    // Serialize message field [sns_1_Indiv]
    bufferOffset = _arraySerializer.int16(obj.sns_1_Indiv, buffer, bufferOffset, null);
    // Serialize message field [sns_2_Indiv]
    bufferOffset = _arraySerializer.int16(obj.sns_2_Indiv, buffer, bufferOffset, null);
    // Serialize message field [sns_3_Indiv]
    bufferOffset = _arraySerializer.int16(obj.sns_3_Indiv, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sensor_Indiv
    let len;
    let data = new Sensor_Indiv(null);
    // Deserialize message field [sns_1_Indiv]
    data.sns_1_Indiv = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_Indiv]
    data.sns_2_Indiv = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_3_Indiv]
    data.sns_3_Indiv = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.sns_1_Indiv.length;
    length += 2 * object.sns_2_Indiv.length;
    length += 2 * object.sns_3_Indiv.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tae_psoc/Sensor_Indiv';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b388094140ac5a2ba7cc9329470ad33d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16[] sns_1_Indiv
    int16[] sns_2_Indiv
    int16[] sns_3_Indiv
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sensor_Indiv(null);
    if (msg.sns_1_Indiv !== undefined) {
      resolved.sns_1_Indiv = msg.sns_1_Indiv;
    }
    else {
      resolved.sns_1_Indiv = []
    }

    if (msg.sns_2_Indiv !== undefined) {
      resolved.sns_2_Indiv = msg.sns_2_Indiv;
    }
    else {
      resolved.sns_2_Indiv = []
    }

    if (msg.sns_3_Indiv !== undefined) {
      resolved.sns_3_Indiv = msg.sns_3_Indiv;
    }
    else {
      resolved.sns_3_Indiv = []
    }

    return resolved;
    }
};

module.exports = Sensor_Indiv;
