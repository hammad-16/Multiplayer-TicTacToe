import 'package:flutter/material.dart';

import '../utils/colors.dart';
class CustomTextFieldGreen extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextFieldGreen({super.key, required this.controller, required this.hintText});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          boxShadow: const [
            BoxShadow(
                color: Colors.green,
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
            hintText:hintText
        ),
      ),

    );
  }
}
