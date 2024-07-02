import 'package:flutter/material.dart';
import 'package:sav_project/widgets/button.dart';
import 'package:sav_project/widgets/profile_form.dart';

import 'drop_down_input_styling.dart';
import 'password_input_styling.dart';
import 'text_input_styling.dart' as TextInputStyling;

class FieldDetail {
  final String label;
  final String icon;
  final double height;
  final double width;
  final WidgetType widgetType;
  final List<String> items;

  FieldDetail(
      {required this.label,
      this.icon = '',
      this.height = 30,
      this.width = 30,
      required this.widgetType,
      this.items = const []});
}

class FormWidget extends StatefulWidget {
  final List<FieldDetail> fields;

  const FormWidget({super.key, required this.fields});

  @override
  FormWidgetState createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.fields.length * 2 - 1, (index) {
              if (index % 2 == 0) {
                final field = widget.fields[index ~/ 2];
                return FieldInput(
                  label: field.label,
                  icon: field.icon,
                  height: field.height,
                  width: field.width,
                  widgetType: field.widgetType,
                  items: field.items,
                );
              } else {
                return SizedBox(height: 30);
              }
            }),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
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
                      backgroundColor: Color(0xFF039388),
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
                      textColor: Color(0xFF039388),
                      backgroundColor: Color(0xFFEEF0F3),
                      text: 'Annuler'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

enum WidgetType {
  TextInputStyling,
  DropDownInputStyling,
  PasswordInputStyling,
  DateInputStyling,
  TimeInputStyling,
}

class FieldInput extends StatelessWidget {
  const FieldInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.height,
    required this.width,
    required this.widgetType,
    this.items = const [],
  }) : super(key: key);

  final String label;
  final String icon;
  final double width;
  final double height;
  final WidgetType widgetType;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: 60,
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
          child: widgetType == WidgetType.TextInputStyling
              ? TextInputStyling.TextInputStyling(
                  icon: icon,
                  height: height,
                  width: width,
                  label: label,
                )
              : widgetType == WidgetType.DropDownInputStyling
                  ? CustomDropdown(
                      icon: icon,
                      height: height,
                      width: width,
                      label: label,
                      items: items!,
                    )
                  : widgetType == WidgetType.PasswordInputStyling
                      ? PasswordInputStyling(
                          label: label,
                        )
                      : widgetType == WidgetType.DateInputStyling
                          ? DateInputStyling(
                              label: label,
                              icon: icon,
                              width: width,
                              height: height,
                            )
                          : TimeInputStyling(
                              label: label,
                              icon: icon,
                              width: width,
                              height: height,
                            ),
        ),
      ],
    );
  }
}
