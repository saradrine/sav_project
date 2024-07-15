import 'package:flutter/material.dart';
import 'package:sav_project/models/offer.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpecialOffers extends StatelessWidget {
  final List<Offer> offers = [
    Offer(
      backgroundImage: 'offer_background.jpg',
      title: 'Offre 1',
      details: 'Détails de l\'offre 1',
    ),
    Offer(
      backgroundImage: 'offer_background.jpg',
      title: 'Offre 2',
      details: 'Détails de l\'offre 2',
    ),
    Offer(
      backgroundImage: 'offer_background.jpg',
      title: 'Offre 3',
      details: 'Détails de l\'offre 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Offres spéciales',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CarouselSlider.builder(
            itemCount: offers.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/' + offers[index].backgroundImage,
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.5),
                        colorBlendMode: BlendMode.darken,
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offers[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                offers[index].details,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.8,
              aspectRatio: 2.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 10),
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
