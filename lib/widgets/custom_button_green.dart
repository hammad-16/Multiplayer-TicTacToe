import 'package:flutter/material.dart';

class CustomButtonGreen extends StatefulWidget {
  final VoidCallback onTap; // Function callback
  final String text;

  const CustomButtonGreen({super.key, required this.onTap, required this.text});

  @override
  _CustomButtonGreenState createState() => _CustomButtonGreenState();
}

class _CustomButtonGreenState extends State<CustomButtonGreen> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) {
          setState(() => isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: isPressed ? 30 : 40,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF00FF00), // Neon Green
                Color(0xFF00CC00), // Bright Green
                Color(0xFF009900), // Deep Green
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(isHovered ? 24 : 0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00FF00).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(-15, -10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF00CC00).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(15, -10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF009900).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(15, 10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF006600).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(-15, 10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(11, 9, 24, 1), // Matching dark background
                borderRadius: BorderRadius.circular(isHovered ? 20 : 0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: isPressed ? 30 : 40,
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Color(0xFF00FF00), // Neon Green text
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
