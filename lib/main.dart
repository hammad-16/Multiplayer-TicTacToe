import 'package:flutter/material.dart';
import 'package:tictactoe/screens/create_room.dart';
import 'package:tictactoe/screens/join_room.dart';
import 'package:tictactoe/screens/main_menu.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName:(context)=> const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen()
        },
        initialRoute: MainMenuScreen.routeName,

      );


  }
}
