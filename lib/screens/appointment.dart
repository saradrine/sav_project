import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/service.dart';
import 'package:sav_project/providers/services_provider.dart';
import 'package:sav_project/widgets/field_input.dart';
import 'package:sav_project/widgets/form.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    List<Service>? services = context.watch<ServicesProvider>().services;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Merci de fournir les détails nécessaires pour planifier votre visite.",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
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
                      fontSize: 15,
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
                      fontSize: 15,
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
                  width: 23,
                ),
                FieldDetail(
                  label: 'Heure',
                  icon: 'clock.png',
                  widgetType: WidgetType.TimeInputStyling,
                  width: 23,
                ),
                FieldDetail(
                  label: 'Véhicule',
                  icon: 'car.png',
                  widgetType: WidgetType.DropDownInputStyling,
                  width: 27,
                ),
                FieldDetail(
                  label: 'Service',
                  icon: 'customer-support.png',
                  items: services!.map((service) => service.nom).toList(),
                  widgetType: WidgetType.DropDownInputStyling,
                  width: 23,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
