// Auto-generated. Do not edit!

// (in-package uuv_perception.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class obj_detected {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.w = null;
      this.h = null;
      this.color = null;
      this.clase = null;
      this.X = null;
      this.Y = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0;
      }
      if (initObj.hasOwnProperty('h')) {
        this.h = initObj.h
      }
      else {
        this.h = 0;
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = '';
      }
      if (initObj.hasOwnProperty('clase')) {
        this.clase = initObj.clase
      }
      else {
        this.clase = '';
      }
      if (initObj.hasOwnProperty('X')) {
        this.X = initObj.X
      }
      else {
        this.X = 0.0;
      }
      if (initObj.hasOwnProperty('Y')) {
        this.Y = initObj.Y
      }
      else {
        this.Y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type obj_detected
    // Serialize message field [x]
    bufferOffset = _serializer.int64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int64(obj.y, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.int64(obj.w, buffer, bufferOffset);
    // Serialize message field [h]
    bufferOffset = _serializer.int64(obj.h, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = _serializer.string(obj.color, buffer, bufferOffset);
    // Serialize message field [clase]
    bufferOffset = _serializer.string(obj.clase, buffer, bufferOffset);
    // Serialize message field [X]
    bufferOffset = _serializer.float32(obj.X, buffer, bufferOffset);
    // Serialize message field [Y]
    bufferOffset = _serializer.float32(obj.Y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type obj_detected
    let len;
    let data = new obj_detected(null);
    // Deserialize message field [x]
    data.x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [h]
    data.h = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [clase]
    data.clase = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [X]
    data.X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Y]
    data.Y = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.color);
    length += _getByteLength(object.clase);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uuv_perception/obj_detected';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da6765af81f6dec4fa013c786451a3ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new obj_detected(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0
    }

    if (msg.h !== undefined) {
      resolved.h = msg.h;
    }
    else {
      resolved.h = 0
    }

    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = ''
    }

    if (msg.clase !== undefined) {
      resolved.clase = msg.clase;
    }
    else {
      resolved.clase = ''
    }

    if (msg.X !== undefined) {
      resolved.X = msg.X;
    }
    else {
      resolved.X = 0.0
    }

    if (msg.Y !== undefined) {
      resolved.Y = msg.Y;
    }
    else {
      resolved.Y = 0.0
    }

    return resolved;
    }
};

module.exports = obj_detected;
