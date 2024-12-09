import 'package:socket_io_client/socket_io_client.dart' as IO;

//The as IO statement is a namespace alias to avoid conflicts with other libraries or identifiers in the code
//Using IO, all references to the library (e.g., IO.Socket) can be scoped clearly.

class SocketClient{
IO.Socket? socket;
static SocketClient? _instance;

SocketClient._internal() //Private constructor
{
   socket = IO.io('http://192.168.2.105:6969',
  <String,dynamic>{
    "transports":["websocket"],
    "autoConnect": false,
  });
  //Pass the server, for now using our ip address
  socket!.connect();
}

static SocketClient get instance{

  _instance ??=SocketClient._internal();
  return _instance!;

}


}