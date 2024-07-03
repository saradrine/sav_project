import 'package:flutter/material.dart';
import 'package:sav_project/widgets/field_input.dart';
import 'package:sav_project/widgets/form.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Merci de fournir les détails nécessaires pour planifier votre visite.",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Veuillez noter que votre rendez-vous doit être confirmé par notre équipe.",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Vous recevrez une réponse bientôt.",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            FormWidget(
              fields: [
                FieldDetail(
                  label: 'Date',
                  icon: 'calendar1.png',
                  widgetType: WidgetType.DateInputStyling,
                ),
                FieldDetail(
                  label: 'Heure',
                  icon: 'clock.png',
                  widgetType: WidgetType.TimeInputStyling,
                ),
                FieldDetail(
                  label: 'Véhicule',
                  icon: 'car.png',
                  widgetType: WidgetType.DropDownInputStyling,
                ),
                FieldDetail(
                  label: 'Service',
                  icon: 'customer-support.png',
                  items: ['Vidange', 'Réparation', 'Diagnostic'],
                  widgetType: WidgetType.DropDownInputStyling,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
