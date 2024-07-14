import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.authBachkroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.3,
          decoration: BoxDecoration(
            color: AppColors.kBaseColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Image.asset(
            'assets/icons/mail.png',
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}