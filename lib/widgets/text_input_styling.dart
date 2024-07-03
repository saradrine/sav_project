import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class TextInputStyling extends StatelessWidget {
  const TextInputStyling({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
    required this.label,
  });

  final String icon;
  final double height;
  final double width;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "$label...",
        hintStyle: TextStyle(
          color: AppColors.hintColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/' + icon,
            width: width,
            height: height,
          ),
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: (60 - height) / 2),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${label} obligatoire';
        }
        return null;
      },
      // onSaved: (String value) {
      //   _marque = value;
      // },
    );
  }
}
