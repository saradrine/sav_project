import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({
    super.key,
    required this.sentence,
    required this.action,
    required this.onPressed,
  });

  final String sentence;
  final String action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(sentence),
        TextButton(
          onPressed: onPressed,
          child: Text(
            action,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              decorationColor: AppColors.kPrimaryColor,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
