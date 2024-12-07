import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

       boxShadow: const [
         BoxShadow(
             color: Colors.red,
             blurRadius: 5

         )
       ]

      ),
      child: TextField(

        controller: controller ,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: bgColor,
          filled: true,
          hintText:hintText,
        ),
      ),

    );
  }
}
