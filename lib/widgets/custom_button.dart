import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onTap; // Function callback
  final String text;

  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
                Color(0xFFFF0044), // Bright Red
                Color(0xFFAA0033), // Deep Red
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(isHovered ? 24 : 0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF0044).withOpacity(isHovered ? 0.6 : 0.4),
                offset: const Offset(-10, -6),
                blurRadius: 20,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFFAA0033).withOpacity(isHovered ? 0.5 : 0.3),
                offset: const Offset(10, -6),
                blurRadius: 20,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF770022).withOpacity(isHovered ? 0.4 : 0.2),
                offset: const Offset(10, 6),
                blurRadius: 20,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF550011).withOpacity(isHovered ? 0.3 : 0.1),
                offset: const Offset(-10, 6),
                blurRadius: 20,
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
                  color: Color(0xFFFF0055), // Neon Red Text
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
