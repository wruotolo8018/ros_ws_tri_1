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

class cmdToPsoc {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmdInput = null;
    }
    else {
      if (initObj.hasOwnProperty('cmdInput')) {
        this.cmdInput = initObj.cmdInput
      }
      else {
        this.cmdInput = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cmdToPsoc
    // Serialize message field [cmdInput]
    bufferOffset = _serializer.uint16(obj.cmdInput, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cmdToPsoc
    let len;
    let data = new cmdToPsoc(null);
    // Deserialize message field [cmdInput]
    data.cmdInput = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tae_psoc/cmdToPsoc';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0f597ee8bf0974f4111872a37a845ee1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 cmdInput
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cmdToPsoc(null);
    if (msg.cmdInput !== undefined) {
      resolved.cmdInput = msg.cmdInput;
    }
    else {
      resolved.cmdInput = 0
    }

    return resolved;
    }
};

module.exports = cmdToPsoc;
