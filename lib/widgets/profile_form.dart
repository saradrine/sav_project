import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/button.dart';

import 'date_input_styling.dart';
import 'phone_input_styling.dart';

class ProfileFieldDetail {
  final String label;
  final String? icon;
  final double height;
  final double width;
  final WidgetType widgetType;
  final String content;

  ProfileFieldDetail({
    required this.label,
    this.icon,
    this.height = 30,
    this.width = 30,
    required this.widgetType,
    required this.content,
  });
}

enum WidgetType {
  TextInputStyling,
  PhoneInputStyling,
  DateInputStyling,
  DropDownInputStyling
}

class ProfileForm extends StatefulWidget {
  final List<ProfileFieldDetail> fields;

  ProfileForm({required this.fields});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonStyled(
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
                      textColor: Colors.white,
                      backgroundColor: AppColors.kPrimaryColor,
                      text: 'Sauvegarder'),
                  SizedBox(
                    width: 15,
                  ),
                  ButtonStyled(
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
                      textColor: AppColors.kPrimaryColor,
                      backgroundColor: Color(0xFFEEF0F3),
                      text: 'Annuler'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ...List.generate(widget.fields.length * 2 - 1, (index) {
              if (index % 2 == 0) {
                final field = widget.fields[index ~/ 2];
                return ProfileFieldInput(
                  label: field.label,
                  icon: field.icon!,
                  height: field.height,
                  width: field.width,
                  widgetType: field.widgetType,
                  content: field.content,
                );
              } else {
                return SizedBox(height: 15);
              }
            }),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileFieldInput extends StatelessWidget {
  const ProfileFieldInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.widgetType,
    required this.content,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final WidgetType widgetType;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: widgetType == WidgetType.TextInputStyling
            ? TextInputStyling(
                label: label,
                icon: icon,
                height: height,
                width: width,
                content: content,
                keyboardType: TextInputType.text,
              )
            : widgetType == WidgetType.PhoneInputStyling
                ? PhoneInputStyling(
                    label: label,
                    icon: icon,
                    content: content,
                    width: width,
                    height: height,
                  )
                : DateInputStyling(
                    label: label,
                    icon: icon,
                    content: content,
                    width: width,
                    height: height,
                  ),
      ),
    );
  }
}

class TextInputStyling extends StatelessWidget {
  const TextInputStyling({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.content,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final String content;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: content,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.hintColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            'assets/icons/' + icon,
            width: width,
            height: height,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label obligatoire';
        }
        return null;
      },
    );
  }
}
