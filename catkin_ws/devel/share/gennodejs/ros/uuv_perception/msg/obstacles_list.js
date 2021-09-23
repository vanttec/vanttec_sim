// Auto-generated. Do not edit!

// (in-package uuv_perception.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class obstacles_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.len = null;
      this.obstacles = null;
    }
    else {
      if (initObj.hasOwnProperty('len')) {
        this.len = initObj.len
      }
      else {
        this.len = 0;
      }
      if (initObj.hasOwnProperty('obstacles')) {
        this.obstacles = initObj.obstacles
      }
      else {
        this.obstacles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type obstacles_list
    // Serialize message field [len]
    bufferOffset = _serializer.int64(obj.len, buffer, bufferOffset);
    // Serialize message field [obstacles]
    // Serialize the length for message field [obstacles]
    bufferOffset = _serializer.uint32(obj.obstacles.length, buffer, bufferOffset);
    obj.obstacles.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type obstacles_list
    let len;
    let data = new obstacles_list(null);
    // Deserialize message field [len]
    data.len = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [obstacles]
    // Deserialize array length for message field [obstacles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacles[i] = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.obstacles.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'uuv_perception/obstacles_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a453c0a1913f2b0504b7bfd6d9fa3f87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 len
    geometry_msgs/Vector3[] obstacles
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new obstacles_list(null);
    if (msg.len !== undefined) {
      resolved.len = msg.len;
    }
    else {
      resolved.len = 0
    }

    if (msg.obstacles !== undefined) {
      resolved.obstacles = new Array(msg.obstacles.length);
      for (let i = 0; i < resolved.obstacles.length; ++i) {
        resolved.obstacles[i] = geometry_msgs.msg.Vector3.Resolve(msg.obstacles[i]);
      }
    }
    else {
      resolved.obstacles = []
    }

    return resolved;
    }
};

module.exports = obstacles_list;
