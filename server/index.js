// importing modules
const express = require('express');
// import http from http.dart => This the Nodejs version of Flutter
const http = require('http');
const mongoose = require('mongoose');
const app = express();
const port = process.env.PORT || 6969;
var server = http.createServer(app);
 const Room = require("./models/room");
 var io = require('socket.io')(server);
///This will convert all the incoming data to json format
////middle ware
app.use(express.json());

const DB = "mongodb+srv://Hammad:Hammad%40197@cluster0.gwsga.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
io.on("connection", (socket)=>{
console.log('new device connected');
socket.on('createRoom', async ({nickname})=> {
try{
console.log(nickname);
//Room is created(Server Side)
let room = new Room();
//This is the player object
let player = {
socketID : socket.id,
nickname,
playerType: 'X',

};
//Player is stored in the room(Server Side)
room.players.push(player);
room.turn = player;

room = await room.save();
//.save will return additional properties like room id
console.log(room);
const roomId = room._id.toString();
socket.join(roomId);

io.to(roomId).emit('createRoomSuccess', room);
room.isJoin =true;
}
catch(e)
{
console.log(e);
}


});
socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {

      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
      log('hehehehe');
              socket.emit("errorOccurred", "Please enter a valid room ID.");
              return;
              }
      let room = await Room.findById(roomId);

      if (room.isJoin) {
        let player = {
          nickname,
          socketID: socket.id,
          playerType: "O",
        };
        socket.join(roomId);
        room.players.push(player);
        room.isJoin = false;
        room = await room.save();
        io.to(roomId).emit("joinRoomSuccess", room);
        io.to(roomId).emit("updatePlayers", room.players);
        io.to(roomId).emit("updateRoom", room);
      } else {
        socket.emit(
          "errorOccurred",
          "The game is in progress, try again later."
        );
      }
    } catch (e) {
      console.log(e);
    }
  });
});
mongoose.connect(DB).then(()=>{
console.log("Connection successful!");
})
.catch((e)=> {
console.log(e);
}
);

server.listen(port, '0.0.0.0', () => {
  console.log(`Server started and running on port ${port}`)
}
);

