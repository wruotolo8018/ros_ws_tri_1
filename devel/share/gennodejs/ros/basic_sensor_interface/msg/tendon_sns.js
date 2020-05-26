// Auto-generated. Do not edit!

// (in-package basic_sensor_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class tendon_sns {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.prox1 = null;
      this.dist1 = null;
      this.hype1 = null;
      this.prox2 = null;
      this.dist2 = null;
      this.hype2 = null;
      this.prox3 = null;
      this.dist3 = null;
      this.hype3 = null;
    }
    else {
      if (initObj.hasOwnProperty('prox1')) {
        this.prox1 = initObj.prox1
      }
      else {
        this.prox1 = 0;
      }
      if (initObj.hasOwnProperty('dist1')) {
        this.dist1 = initObj.dist1
      }
      else {
        this.dist1 = 0;
      }
      if (initObj.hasOwnProperty('hype1')) {
        this.hype1 = initObj.hype1
      }
      else {
        this.hype1 = 0;
      }
      if (initObj.hasOwnProperty('prox2')) {
        this.prox2 = initObj.prox2
      }
      else {
        this.prox2 = 0;
      }
      if (initObj.hasOwnProperty('dist2')) {
        this.dist2 = initObj.dist2
      }
      else {
        this.dist2 = 0;
      }
      if (initObj.hasOwnProperty('hype2')) {
        this.hype2 = initObj.hype2
      }
      else {
        this.hype2 = 0;
      }
      if (initObj.hasOwnProperty('prox3')) {
        this.prox3 = initObj.prox3
      }
      else {
        this.prox3 = 0;
      }
      if (initObj.hasOwnProperty('dist3')) {
        this.dist3 = initObj.dist3
      }
      else {
        this.dist3 = 0;
      }
      if (initObj.hasOwnProperty('hype3')) {
        this.hype3 = initObj.hype3
      }
      else {
        this.hype3 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tendon_sns
    // Serialize message field [prox1]
    bufferOffset = _serializer.int32(obj.prox1, buffer, bufferOffset);
    // Serialize message field [dist1]
    bufferOffset = _serializer.int32(obj.dist1, buffer, bufferOffset);
    // Serialize message field [hype1]
    bufferOffset = _serializer.int32(obj.hype1, buffer, bufferOffset);
    // Serialize message field [prox2]
    bufferOffset = _serializer.int32(obj.prox2, buffer, bufferOffset);
    // Serialize message field [dist2]
    bufferOffset = _serializer.int32(obj.dist2, buffer, bufferOffset);
    // Serialize message field [hype2]
    bufferOffset = _serializer.int32(obj.hype2, buffer, bufferOffset);
    // Serialize message field [prox3]
    bufferOffset = _serializer.int32(obj.prox3, buffer, bufferOffset);
    // Serialize message field [dist3]
    bufferOffset = _serializer.int32(obj.dist3, buffer, bufferOffset);
    // Serialize message field [hype3]
    bufferOffset = _serializer.int32(obj.hype3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tendon_sns
    let len;
    let data = new tendon_sns(null);
    // Deserialize message field [prox1]
    data.prox1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dist1]
    data.dist1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [hype1]
    data.hype1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [prox2]
    data.prox2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dist2]
    data.dist2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [hype2]
    data.hype2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [prox3]
    data.prox3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dist3]
    data.dist3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [hype3]
    data.hype3 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'basic_sensor_interface/tendon_sns';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '14b8ac042010c67e52d9cebc316f5c93';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 prox1
    int32 dist1
    int32 hype1
    int32 prox2
    int32 dist2
    int32 hype2
    int32 prox3
    int32 dist3
    int32 hype3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tendon_sns(null);
    if (msg.prox1 !== undefined) {
      resolved.prox1 = msg.prox1;
    }
    else {
      resolved.prox1 = 0
    }

    if (msg.dist1 !== undefined) {
      resolved.dist1 = msg.dist1;
    }
    else {
      resolved.dist1 = 0
    }

    if (msg.hype1 !== undefined) {
      resolved.hype1 = msg.hype1;
    }
    else {
      resolved.hype1 = 0
    }

    if (msg.prox2 !== undefined) {
      resolved.prox2 = msg.prox2;
    }
    else {
      resolved.prox2 = 0
    }

    if (msg.dist2 !== undefined) {
      resolved.dist2 = msg.dist2;
    }
    else {
      resolved.dist2 = 0
    }

    if (msg.hype2 !== undefined) {
      resolved.hype2 = msg.hype2;
    }
    else {
      resolved.hype2 = 0
    }

    if (msg.prox3 !== undefined) {
      resolved.prox3 = msg.prox3;
    }
    else {
      resolved.prox3 = 0
    }

    if (msg.dist3 !== undefined) {
      resolved.dist3 = msg.dist3;
    }
    else {
      resolved.dist3 = 0
    }

    if (msg.hype3 !== undefined) {
      resolved.hype3 = msg.hype3;
    }
    else {
      resolved.hype3 = 0
    }

    return resolved;
    }
};

module.exports = tendon_sns;
