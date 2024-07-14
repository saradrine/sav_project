import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/button.dart';
import 'field_input.dart';

class FormWidget extends StatefulWidget {
  final List<FieldDetail> fields;
  final bool changePwd;

  const FormWidget({
    super.key,
    required this.fields,
    this.changePwd = false,
  });

  @override
  FormWidgetState createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                return SizedBox(height: 20);
              }
            }),
            SizedBox(
              height: 30,
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
                      backgroundColor: AppColors.kPrimaryColor,
                      text: 'Sauvegarder'),
                  SizedBox(
                    width: 15,
                  ),
                  ButtonStyled(
                      onPressed: () {
                        if (_formKey.currentState != null) {
                          _formKey.currentState!.reset();
                        }
                        if (widget.changePwd) {
                          Navigator.pop(context);
                        }
                      },
                      textColor: AppColors.kPrimaryColor,
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
