// importing modules
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
// const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 6969;
var server = http.createServer(app);
 var io = require('socket.io')(server);

app.use(express.json());

const DB = "mongodb+srv://Hammad:Hammad%40197@cluster0.gwsga.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
io.on("connection", (socket)=>{
console.log('new device connected');
})
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







//const express = require('express');
//const http = require('http');
//const mongoose = require('mongoose');
//// import http from http.dart => This the Nodejs version of Flutter
//
//const app = express();
//const port = process.env.PORT||3000 ;
//var server = http.createServer(app);
//var io = require('socket.io')(server);
//
////This will convert all the incoming data to json format
////middle ware
//app.use(express.json());
//
//const DB = "mongodb+srv://Hammad:Hammad@197@cluster0.gwsga.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
//console.log(DB);
//mongoose.connect(DB).then(()=>{
//console.log("Connection successful!");
//})
//.catch((e)=> {
//console.log(e);
//}
//);
//
//server.listen(port, '0.0.0.0', ()=>
//{
//console.log(`Server started and running on port ${port}`)
//}
//);
