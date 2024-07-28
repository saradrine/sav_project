import 'package:flutter/material.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/theme/colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final String iconPath;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? validatorMessage;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final int? maxLength;

  const AuthTextField({
    this.controller,
    required this.label,
    required this.hintText,
    required this.iconPath,
    this.obscureText = false,
    this.suffixIcon,
    this.validatorMessage,
    this.textInputType = TextInputType.text,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.85,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kAuthTextFieldBorderRadius),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              enableSuggestions: !obscureText,
              autocorrect: !obscureText,
              keyboardType: textInputType,
              maxLength: maxLength,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.hintColor),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset(iconPath, width: 25, height: 25),
                ),
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                filled: true,
                fillColor: AppColors.kInputDecorationColor,
                contentPadding: EdgeInsets.symmetric(vertical: (60 - 25) / 2),
                counterText: "", // Hide the counter, but respect the maxLength
              ),
              validator: validator ??
                  (value) {
                    if (value == null || value.isEmpty) {
                      return validatorMessage;
                    }
                    return null;
                  },
            ),
          ),
        ],
      ),
    );
  }
}
