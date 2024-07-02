import 'package:flutter/material.dart';

class ButtonStyled extends StatelessWidget {
  const ButtonStyled({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    this.onPressed,
  }) ;

  final Color textColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
