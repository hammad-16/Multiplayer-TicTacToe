import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/custom_button_green.dart';
import 'package:tictactoe/widgets/custom_text_field_green.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';
class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {

    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body:
        Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(shadows: [
                  Shadow(
                      blurRadius: 40,
                      color: Colors.green
                  )
                ],
                    text: 'Join Room',
                    fontSize: 70),
                SizedBox(height: size.height *0.08,),
                CustomTextFieldGreen(controller: _nameController, hintText: "Enter your nickname"),
                const SizedBox(height: 20),
                CustomTextFieldGreen(controller: _gameIdController, hintText: "Enter Game ID"),
                SizedBox(height: size.height*0.05),
                CustomButtonGreen(onTap: (){}, text: 'Join')
              ],
            ),
          ),
        )
    );
  }
}
