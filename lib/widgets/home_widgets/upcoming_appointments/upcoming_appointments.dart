import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/historiqueRDV.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/home_widgets/upcoming_appointments/upcoming_element.dart';

class UpcomingAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the user from the provider
    User? user = context.watch<UserProvider>().user;

    // Filter appointments where etat == "Accepté"
    List<Historiquerdv> acceptedAppointments = user?.appointments
            .where((appointment) => appointment.etat == 'Accepté')
            .toList() ??
        [];
    double height = acceptedAppointments.isEmpty
        ? MediaQuery.of(context).size.height * 0.03
        : (acceptedAppointments.length > 1
            ? MediaQuery.of(context).size.height * 0.31
            : MediaQuery.of(context).size.height * 0.14);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'À venir',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Layout(
                        specialPageIndex: 5,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Voir historique',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
          child: SizedBox(
            height: height,
            child: acceptedAppointments.isEmpty
                ? Center(
                    child: Text(
                      "Vous n'avez pas de rendez-vous à venir.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.emptyTextColor,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: acceptedAppointments.length,
                    itemBuilder: (context, index) {
                      return UpcomingElement(
                        historique: acceptedAppointments[index],
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
