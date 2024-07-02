import 'package:flutter/material.dart';

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
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "${widget.label}...",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              _obscureText ? 'assets/icons/hide.png' : 'assets/icons/show.png',
              width: 30,
              height: 30,
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
          return '${widget.label} is required';
        }
        return null;
      },
      onChanged: widget.onChanged,
    );
  }
}
