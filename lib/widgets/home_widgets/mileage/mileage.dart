import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/models/vehicule.dart';
import 'package:sav_project/widgets/home_widgets/mileage/mileage_element.dart';

class Mileage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the user from the provider
    User? user = context.watch<UserProvider>().user;

    // Provide a default empty list if user or user.vehicules is null
    List<Vehicule> vehicules = user?.vehicules ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text(
            'Véhicules et kilométrage',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: vehicules.isEmpty
              ? Center(
                  child: Text(
                    "Vous n'avez pas de véhicules.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.emptyTextColor,
                    ),
                  ),
                )
              : CarouselSlider.builder(
                  itemCount: vehicules.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return MileageElement(
                      vehicule: vehicules[index],
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.22,
                    viewportFraction: 0.85,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      // Handle page change
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
