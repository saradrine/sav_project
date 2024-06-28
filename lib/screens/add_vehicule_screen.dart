import 'package:flutter/material.dart';
import 'package:sav_project/widgets/form.dart';

class AddVehiculeScreen extends StatefulWidget {
  const AddVehiculeScreen({super.key});

  @override
  State<AddVehiculeScreen> createState() => _AddVehiculeScreenState();
}

class _AddVehiculeScreenState extends State<AddVehiculeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                'Assurez-vous que toutes les informations sont correctes pour ajouter une nouvelle voiture.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FormWidget(
              fields: [
                FieldDetail(
                    label: 'Type',
                    icon: 'type.png',
                    widgetType: WidgetType.DropDownInputStyling,
                    items: ['Voiture', 'Moto', 'Camion', 'Bus', 'Vélo']),
                FieldDetail(
                  label: 'Marque',
                  icon: 'car.png',
                  widgetType: WidgetType.TextInputStyling,
                ),
                FieldDetail(
                  label: 'Modèle',
                  icon: 'car.png',
                  widgetType: WidgetType.TextInputStyling,
                ),
                FieldDetail(
                  label: 'Année',
                  icon: 'calendar1.png',
                  height: 25,
                  width: 25,
                  widgetType: WidgetType.TextInputStyling,
                ),
                FieldDetail(
                  label: 'Couleur',
                  icon: 'pallete.png',
                  widgetType: WidgetType.TextInputStyling,
                ),
                FieldDetail(
                  label: 'Numéro de châssis',
                  icon: 'numero-de-serie.png',
                  height: 25,
                  width: 25,
                  widgetType: WidgetType.TextInputStyling,
                ),
                FieldDetail(
                  label: "Plaque d'immatriculation",
                  icon: 'Immatriculation.png',
                  widgetType: WidgetType.TextInputStyling,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
