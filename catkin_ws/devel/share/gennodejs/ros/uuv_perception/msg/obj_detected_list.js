// Auto-generated. Do not edit!

// (in-package uuv_perception.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let obj_detected = require('./obj_detected.js');

//-----------------------------------------------------------

class obj_detected_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.len = null;
      this.objects = null;
    }
    else {
      if (initObj.hasOwnProperty('len')) {
        this.len = initObj.len
      }
      else {
        this.len = 0;
      }
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type obj_detected_list
    // Serialize message field [len]
    bufferOffset = _serializer.int64(obj.len, buffer, bufferOffset);
    // Serialize message field [objects]
    // Serialize the length for message field [objects]
    bufferOffset = _serializer.uint32(obj.objects.length, buffer, bufferOffset);
    obj.objects.forEach((val) => {
      bufferOffset = obj_detected.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type obj_detected_list
    let len;
    let data = new obj_detected_list(null);
    // Deserialize message field [len]
    data.len = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [objects]
    // Deserialize array length for message field [objects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.objects[i] = obj_detected.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.objects.forEach((val) => {
      length += obj_detected.getMessageSize(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uuv_perception/obj_detected_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0af283cd0813ba18e9c1091f872861db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 len
    obj_detected[] objects
    
    ================================================================================
    MSG: uuv_perception/obj_detected
    int64 x
    int64 y
    int64 w
    int64 h
    string color
    string clase
    float32 X
    float32 Y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new obj_detected_list(null);
    if (msg.len !== undefined) {
      resolved.len = msg.len;
    }
    else {
      resolved.len = 0
    }

    if (msg.objects !== undefined) {
      resolved.objects = new Array(msg.objects.length);
      for (let i = 0; i < resolved.objects.length; ++i) {
        resolved.objects[i] = obj_detected.Resolve(msg.objects[i]);
      }
    }
    else {
      resolved.objects = []
    }

    return resolved;
    }
};

module.exports = obj_detected_list;
