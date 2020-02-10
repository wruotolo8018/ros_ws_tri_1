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

class SensorPacket {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sns_1_FFT_NS = null;
      this.sns_1_FFT_WE = null;
      this.sns_1_4Ch = null;
      this.sns_1_F_M = null;
      this.sns_2_FFT_NS = null;
      this.sns_2_FFT_WE = null;
      this.sns_2_4Ch = null;
      this.sns_2_F_M = null;
      this.sns1_vorticity = null;
      this.sns2_vorticity = null;
    }
    else {
      if (initObj.hasOwnProperty('sns_1_FFT_NS')) {
        this.sns_1_FFT_NS = initObj.sns_1_FFT_NS
      }
      else {
        this.sns_1_FFT_NS = [];
      }
      if (initObj.hasOwnProperty('sns_1_FFT_WE')) {
        this.sns_1_FFT_WE = initObj.sns_1_FFT_WE
      }
      else {
        this.sns_1_FFT_WE = [];
      }
      if (initObj.hasOwnProperty('sns_1_4Ch')) {
        this.sns_1_4Ch = initObj.sns_1_4Ch
      }
      else {
        this.sns_1_4Ch = [];
      }
      if (initObj.hasOwnProperty('sns_1_F_M')) {
        this.sns_1_F_M = initObj.sns_1_F_M
      }
      else {
        this.sns_1_F_M = [];
      }
      if (initObj.hasOwnProperty('sns_2_FFT_NS')) {
        this.sns_2_FFT_NS = initObj.sns_2_FFT_NS
      }
      else {
        this.sns_2_FFT_NS = [];
      }
      if (initObj.hasOwnProperty('sns_2_FFT_WE')) {
        this.sns_2_FFT_WE = initObj.sns_2_FFT_WE
      }
      else {
        this.sns_2_FFT_WE = [];
      }
      if (initObj.hasOwnProperty('sns_2_4Ch')) {
        this.sns_2_4Ch = initObj.sns_2_4Ch
      }
      else {
        this.sns_2_4Ch = [];
      }
      if (initObj.hasOwnProperty('sns_2_F_M')) {
        this.sns_2_F_M = initObj.sns_2_F_M
      }
      else {
        this.sns_2_F_M = [];
      }
      if (initObj.hasOwnProperty('sns1_vorticity')) {
        this.sns1_vorticity = initObj.sns1_vorticity
      }
      else {
        this.sns1_vorticity = 0.0;
      }
      if (initObj.hasOwnProperty('sns2_vorticity')) {
        this.sns2_vorticity = initObj.sns2_vorticity
      }
      else {
        this.sns2_vorticity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorPacket
    // Serialize message field [sns_1_FFT_NS]
    bufferOffset = _arraySerializer.uint16(obj.sns_1_FFT_NS, buffer, bufferOffset, null);
    // Serialize message field [sns_1_FFT_WE]
    bufferOffset = _arraySerializer.uint16(obj.sns_1_FFT_WE, buffer, bufferOffset, null);
    // Serialize message field [sns_1_4Ch]
    bufferOffset = _arraySerializer.int16(obj.sns_1_4Ch, buffer, bufferOffset, null);
    // Serialize message field [sns_1_F_M]
    bufferOffset = _arraySerializer.float32(obj.sns_1_F_M, buffer, bufferOffset, null);
    // Serialize message field [sns_2_FFT_NS]
    bufferOffset = _arraySerializer.uint16(obj.sns_2_FFT_NS, buffer, bufferOffset, null);
    // Serialize message field [sns_2_FFT_WE]
    bufferOffset = _arraySerializer.uint16(obj.sns_2_FFT_WE, buffer, bufferOffset, null);
    // Serialize message field [sns_2_4Ch]
    bufferOffset = _arraySerializer.int16(obj.sns_2_4Ch, buffer, bufferOffset, null);
    // Serialize message field [sns_2_F_M]
    bufferOffset = _arraySerializer.float32(obj.sns_2_F_M, buffer, bufferOffset, null);
    // Serialize message field [sns1_vorticity]
    bufferOffset = _serializer.float32(obj.sns1_vorticity, buffer, bufferOffset);
    // Serialize message field [sns2_vorticity]
    bufferOffset = _serializer.float32(obj.sns2_vorticity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorPacket
    let len;
    let data = new SensorPacket(null);
    // Deserialize message field [sns_1_FFT_NS]
    data.sns_1_FFT_NS = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [sns_1_FFT_WE]
    data.sns_1_FFT_WE = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [sns_1_4Ch]
    data.sns_1_4Ch = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_1_F_M]
    data.sns_1_F_M = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_FFT_NS]
    data.sns_2_FFT_NS = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_FFT_WE]
    data.sns_2_FFT_WE = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_4Ch]
    data.sns_2_4Ch = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [sns_2_F_M]
    data.sns_2_F_M = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [sns1_vorticity]
    data.sns1_vorticity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sns2_vorticity]
    data.sns2_vorticity = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.sns_1_FFT_NS.length;
    length += 2 * object.sns_1_FFT_WE.length;
    length += 2 * object.sns_1_4Ch.length;
    length += 4 * object.sns_1_F_M.length;
    length += 2 * object.sns_2_FFT_NS.length;
    length += 2 * object.sns_2_FFT_WE.length;
    length += 2 * object.sns_2_4Ch.length;
    length += 4 * object.sns_2_F_M.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tae_psoc/SensorPacket';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b42cd8856cf6ff4337fc1ed6207fb9c0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16[] sns_1_FFT_NS
    uint16[] sns_1_FFT_WE
    int16[] sns_1_4Ch
    float32[] sns_1_F_M
    uint16[] sns_2_FFT_NS
    uint16[] sns_2_FFT_WE
    int16[] sns_2_4Ch
    float32[] sns_2_F_M
    float32 sns1_vorticity
    float32 sns2_vorticity
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorPacket(null);
    if (msg.sns_1_FFT_NS !== undefined) {
      resolved.sns_1_FFT_NS = msg.sns_1_FFT_NS;
    }
    else {
      resolved.sns_1_FFT_NS = []
    }

    if (msg.sns_1_FFT_WE !== undefined) {
      resolved.sns_1_FFT_WE = msg.sns_1_FFT_WE;
    }
    else {
      resolved.sns_1_FFT_WE = []
    }

    if (msg.sns_1_4Ch !== undefined) {
      resolved.sns_1_4Ch = msg.sns_1_4Ch;
    }
    else {
      resolved.sns_1_4Ch = []
    }

    if (msg.sns_1_F_M !== undefined) {
      resolved.sns_1_F_M = msg.sns_1_F_M;
    }
    else {
      resolved.sns_1_F_M = []
    }

    if (msg.sns_2_FFT_NS !== undefined) {
      resolved.sns_2_FFT_NS = msg.sns_2_FFT_NS;
    }
    else {
      resolved.sns_2_FFT_NS = []
    }

    if (msg.sns_2_FFT_WE !== undefined) {
      resolved.sns_2_FFT_WE = msg.sns_2_FFT_WE;
    }
    else {
      resolved.sns_2_FFT_WE = []
    }

    if (msg.sns_2_4Ch !== undefined) {
      resolved.sns_2_4Ch = msg.sns_2_4Ch;
    }
    else {
      resolved.sns_2_4Ch = []
    }

    if (msg.sns_2_F_M !== undefined) {
      resolved.sns_2_F_M = msg.sns_2_F_M;
    }
    else {
      resolved.sns_2_F_M = []
    }

    if (msg.sns1_vorticity !== undefined) {
      resolved.sns1_vorticity = msg.sns1_vorticity;
    }
    else {
      resolved.sns1_vorticity = 0.0
    }

    if (msg.sns2_vorticity !== undefined) {
      resolved.sns2_vorticity = msg.sns2_vorticity;
    }
    else {
      resolved.sns2_vorticity = 0.0
    }

    return resolved;
    }
};

module.exports = SensorPacket;
