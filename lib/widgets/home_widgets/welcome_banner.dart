import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/providers/user_provider.dart';
import 'package:sav_project/theme/colors.dart';

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserProvider>().user;
    final prenom = user?.prenom ?? '';
    final nom = user?.nom ?? '';
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.13,
          padding: EdgeInsets.symmetric(horizontal: 17),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                spreadRadius: 0,
                blurRadius: 18,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bonjour, ' + '$prenom $nom' + ' !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Bienvenue sur votre espace personnel.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 105,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/images/car.png',
            height: 120,
          ),
        ),
      ],
    );
  }
}
