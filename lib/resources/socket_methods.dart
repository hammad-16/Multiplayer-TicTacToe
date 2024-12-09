import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screens/game_screen.dart';

class SocketMethods
{
  final _socketClient = SocketClient.instance.socket!;

//Emits
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  // If we neeed to switch to some other screen we will use navigator,
  void createRoomSuccessListener(BuildContext context)
  {
    _socketClient.on('createRoomSuccess', (room){
      Provider.of<RoomDataProvider>(context, listen:false).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });

  }

}