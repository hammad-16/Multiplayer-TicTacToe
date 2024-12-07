import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/create_room.dart';
import 'package:tictactoe/screens/join_room.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_button_green.dart';
class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen(
      {
        super.key
      }
      );

  void createRoom(BuildContext context)
  {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }
  void joinRoom(BuildContext context)
  {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () => createRoom(context),
                text: "Create Room"),
           const SizedBox(height: 50),
            CustomButtonGreen(
                onTap: ()=> joinRoom(context),
                text: "Join Room")
          ],
        ),
      )
    );
  }
}
