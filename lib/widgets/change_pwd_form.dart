import 'package:flutter/material.dart';
import 'package:sav_project/widgets/form.dart';

class ChangePwdForm extends StatefulWidget {
  @override
  _ChangePwdFormState createState() => _ChangePwdFormState();
}

class _ChangePwdFormState extends State<ChangePwdForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 248, 251),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: FormWidget(
          fields: [
            FieldDetail(
              label: 'Ancien Mot de passe',
              widgetType: WidgetType.PasswordInputStyling,
            ),
            FieldDetail(
              label: 'Nouveau Mot de passe',
              widgetType: WidgetType.PasswordInputStyling,
            ),
            FieldDetail(
              label: 'Confirmer Mot de passe',
              widgetType: WidgetType.PasswordInputStyling,
            ),
          ],
        ),
      ),
    );
  }
}
