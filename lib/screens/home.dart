import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/home_widgets/mileage/mileage.dart';
import 'package:sav_project/widgets/home_widgets/services.dart';
import 'package:sav_project/widgets/home_widgets/special_offers.dart';
import 'package:sav_project/widgets/home_widgets/welcome_banner.dart';
import 'package:sav_project/widgets/home_widgets/upcoming_appointments/upcoming_appointments.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WelcomeBanner(),
            SpecialOffers(),
            CustomizedDivider(),
            Services(),
            CustomizedDivider(),
            UpcomingAppointments(),
            CustomizedDivider(),
            Mileage(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CustomizedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Divider(
        color: Color.fromARGB(255, 209, 209, 209),
        height: 1,
      ),
    );
  }
}
