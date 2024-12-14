import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/screens/create_room.dart';
import 'package:tictactoe/screens/join_room.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_button_green.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlitchText(), // Replaced Text("Game") with GlitchText
            const SizedBox(height: 100),
            CustomButton(
              onTap: () => createRoom(context),
              text: "Create Room",
            ),
            const SizedBox(height: 50),
            CustomButtonGreen(
              onTap: () => joinRoom(context),
              text: "Join Room",
            ),
          ],
        ),
      ),
    );
  }
}

// GlitchText Widget
class GlitchText extends StatefulWidget {
  @override
  _GlitchTextState createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 725),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final random = Random();
        double offsetX1 = random.nextDouble() * 2 - 1;
        double offsetY1 = random.nextDouble() * 2 - 1;
        double offsetX2 = random.nextDouble() * 2 - 1;
        double offsetY2 = random.nextDouble() * 2 - 1;

        return Stack(
          children: [
            Text(
              'XO Multiplayer',
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.lightGreenAccent,
                shadows: [
                  Shadow(offset: Offset(2, 0), color: Colors.red),
                  Shadow(offset: Offset(-1, -1), color: Colors.yellow),
                ],
              ),
            ),
            Positioned(
              left: offsetX1,
              top: offsetY1,
              child: Text(
                'XO Multiplayer',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.cyan.withOpacity(0.75),
                  shadows: [
                    Shadow(offset: Offset(2, 0), color: Colors.red),
                    Shadow(offset: Offset(-1, -1), color: Colors.yellow),
                  ],
                ),
              ),
            ),
            Positioned(
              left: offsetX2,
              top: offsetY2,
              child: Text(
                'XO Multiplayer',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.yellow.withOpacity(0.75),
                  shadows: [
                    Shadow(offset: Offset(2, 0), color: Colors.red),
                    Shadow(offset: Offset(-1, -1), color: Colors.yellow),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
