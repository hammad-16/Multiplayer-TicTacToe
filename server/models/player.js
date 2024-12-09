const mongoose = require('mongoose');

const playerSchema = new mongoose.Schema({
  nickname: {
    type: String,
    trim: true,
  },
  socketID: { // Fixed typo 'sockerID' -> 'socketID'
    type: String,
  },
  points: {
    type: Number,
    default: 0,
  },
  playerType: { // Ensure proper formatting
    required: true,
    type: String,
  },
});

module.exports = playerSchema;
