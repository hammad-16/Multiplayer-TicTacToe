const mongoose = require('mongoose');
const playerSchema = require("./player")
const roomSchema = new mongoose.Schema({
         occupancy :
         {
         type: Number,
         default:2,

         },
         maxRounds:
         {
         type: Number,
         default: 5
         },
         currentRound:
         {
         required:true,
         type:Number,
         default:1
         },
         players: [playerSchema],
         //Will tell if the room is joinable
         isJoin: {
         type: Boolean,
         default: true
         },
         turn : playerSchema,
         turnIndex :
         {
         type: Number,
         default: 0,
         }



});

const roomModel =mongoose.model('Room', roomSchema);
module.exports = roomModel;