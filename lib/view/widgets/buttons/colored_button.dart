import 'package:flutter/material.dart';
import 'package:pokemon_catcher/constants/colors.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    required this.text,
    this.backgroundColor = brightRed,
    this.foregroundColor = darkerRed,
    this.textColor = Colors.white,
    required this.onPressed,
    super.key,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          surfaceTintColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
