// Auto-generated. Do not edit!

// (in-package my_message.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GraphData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ms_error = null;
      this.y_desired = null;
      this.y_sensed = null;
      this.x_value = null;
    }
    else {
      if (initObj.hasOwnProperty('ms_error')) {
        this.ms_error = initObj.ms_error
      }
      else {
        this.ms_error = 0.0;
      }
      if (initObj.hasOwnProperty('y_desired')) {
        this.y_desired = initObj.y_desired
      }
      else {
        this.y_desired = 0.0;
      }
      if (initObj.hasOwnProperty('y_sensed')) {
        this.y_sensed = initObj.y_sensed
      }
      else {
        this.y_sensed = 0.0;
      }
      if (initObj.hasOwnProperty('x_value')) {
        this.x_value = initObj.x_value
      }
      else {
        this.x_value = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphData
    // Serialize message field [ms_error]
    bufferOffset = _serializer.float32(obj.ms_error, buffer, bufferOffset);
    // Serialize message field [y_desired]
    bufferOffset = _serializer.float32(obj.y_desired, buffer, bufferOffset);
    // Serialize message field [y_sensed]
    bufferOffset = _serializer.float32(obj.y_sensed, buffer, bufferOffset);
    // Serialize message field [x_value]
    bufferOffset = _serializer.float32(obj.x_value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphData
    let len;
    let data = new GraphData(null);
    // Deserialize message field [ms_error]
    data.ms_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_desired]
    data.y_desired = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_sensed]
    data.y_sensed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x_value]
    data.x_value = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_message/GraphData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6b8316f3e4d87486410c1f8c55c6794f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 ms_error 
    float32 y_desired
    float32 y_sensed
    float32 x_value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphData(null);
    if (msg.ms_error !== undefined) {
      resolved.ms_error = msg.ms_error;
    }
    else {
      resolved.ms_error = 0.0
    }

    if (msg.y_desired !== undefined) {
      resolved.y_desired = msg.y_desired;
    }
    else {
      resolved.y_desired = 0.0
    }

    if (msg.y_sensed !== undefined) {
      resolved.y_sensed = msg.y_sensed;
    }
    else {
      resolved.y_sensed = 0.0
    }

    if (msg.x_value !== undefined) {
      resolved.x_value = msg.x_value;
    }
    else {
      resolved.x_value = 0.0
    }

    return resolved;
    }
};

module.exports = GraphData;
