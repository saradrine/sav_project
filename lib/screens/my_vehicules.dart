import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/models/vehicule.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/theme/colors.dart';
import '../widgets/vehicule_element.dart';
import '../widgets/button.dart';
import 'package:sav_project/screens/layout.dart';

class MyVehicules extends StatefulWidget {
  const MyVehicules({super.key});

  @override
  State<MyVehicules> createState() => _MyVehiculesState();
}

class _MyVehiculesState extends State<MyVehicules> {
  void onDismissed(Vehicule vehicule) {
    setState(() {
      // vehicules.remove(vehicule);
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserProvider>().user;

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                child: ButtonStyled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Layout(initialIndex: 2),
                      ),
                    );
                  },
                  textColor: Colors.white,
                  backgroundColor: AppColors.kPrimaryColor,
                  text: 'Ajouter véhicule',
                ),
              ),
            ],
          ),
          user!.vehicules.isEmpty
              ? Center(
                  child: Text(
                    "Vous n'avez encore ajouté aucune voiture.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: AppColors.emptyTextColor),
                  ),
                )
              : Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 16,
                    ),
                    child: ListView.builder(
                      itemCount: user.vehicules.length,
                      itemBuilder: (context, index) {
                        return VehiculeElement(
                          vehicule: user.vehicules[index],
                          onDismissed: onDismissed,
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
