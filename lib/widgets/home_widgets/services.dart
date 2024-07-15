import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sav_project/theme/colors.dart';

class Services extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'icon': 'assets/icons/bell.png', 'name': 'Vidange'},
    {'icon': 'assets/icons/calendar.png', 'name': 'Pneumatique'},
    {'icon': 'assets/icons/clock.png', 'name': 'Carrosserie'},
    {'icon': 'assets/icons/customer-support.png', 'name': 'Diagnostic'},
    {'icon': 'assets/icons/calendar.png', 'name': 'Peinture'},
    {'icon': 'assets/icons/calendar.png', 'name': 'Réparation'},
    {'icon': 'assets/icons/calendar.png', 'name': 'Climatisation'},
    {'icon': 'assets/icons/calendar.png', 'name': 'Electricité'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Services',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Voir tout',
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
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
          child: CarouselSlider.builder(
            itemCount: services.length,
            itemBuilder: (context, index, realIndex) {
              final service = services[index];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        service['icon']!,
                        fit: BoxFit.contain,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    service['name']!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.11,
              enableInfiniteScroll: true,
              viewportFraction: 0.25,
              initialPage: 0,
              padEnds: false,
            ),
          ),
        ),
      ],
    );
  }
}
