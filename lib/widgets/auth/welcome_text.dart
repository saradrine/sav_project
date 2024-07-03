import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class WelcomeTextAuth extends StatelessWidget {
  const WelcomeTextAuth({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) => WelcomeText(
        title: title,
        subtitle: subtitle,
      );
}

class WelcomeText extends StatelessWidget {
  final String title;
  final String subtitle;

  const WelcomeText({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.kTextColor,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
