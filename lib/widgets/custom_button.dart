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
    final width = MediaQuery.of(context).size.width;

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
                Color(0xFF5728FF), // Deep Purple
                Color(0xFF8700FF), // Bright Purple
                Color(0xFFAA00FF), // Vibrant Magenta
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(isHovered ? 24 : 0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5728FF).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(-15, -10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF8700FF).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(15, -10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFFAA00FF).withOpacity(isHovered ? 0.8 : 0.6),
                offset: const Offset(15, 10),
                blurRadius: 30,
                spreadRadius: -5,
              ),
              BoxShadow(
                color: const Color(0xFF4C00AA).withOpacity(isHovered ? 0.8 : 0.6),
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
                color: const Color.fromRGBO(11, 9, 24, 1), // Matching the background color
                borderRadius: BorderRadius.circular(isHovered ? 20 : 0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: isPressed ? 30 : 40,
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
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
