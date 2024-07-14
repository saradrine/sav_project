import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class PasswordInputStyling extends StatefulWidget {
  const PasswordInputStyling({
    Key? key,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final Function(String)? onChanged;

  @override
  _PasswordInputStylingState createState() => _PasswordInputStylingState();
}

class _PasswordInputStylingState extends State<PasswordInputStyling> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: "${widget.label}...",
        hintStyle: TextStyle(
          color: AppColors.hintColor,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/padlock.png',
            width: 22,
            height: 22,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              _obscureText ? 'assets/icons/show.png' : 'assets/icons/hide.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.label} obligatoire';
        }
        return null;
      },
      onChanged: widget.onChanged,
    );
  }
}
