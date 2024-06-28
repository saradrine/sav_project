import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonStyled extends StatelessWidget {
  const ButtonStyled({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final Color textColor;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
            // _formKey.currentState.save();
          }
        },
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
