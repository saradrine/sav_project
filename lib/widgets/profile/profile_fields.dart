import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sav_project/models/user.dart';

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

class ProfileFields extends StatelessWidget {
  final User user;

  ProfileFields({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Field(
            content: user.firstName,
            icon: 'assets/icons/user.png',
            width: 26,
          ),
          SizedBox(height: 13),
          Field(
            content: user.lastName,
            icon: 'assets/icons/user.png',
            width: 26,
          ),
          SizedBox(height: 13),
          Field(
            content: user.email,
            icon: 'assets/icons/email.png',
            width: 23,
          ),
          SizedBox(height: 13),
          Field(
            content: user.phone,
            icon: 'assets/icons/mobile-phone.png',
          ),
          SizedBox(height: 13),
          Field(
            content: user.job,
            icon: 'assets/icons/suitcase.png',
            width: 23,
          ),
          SizedBox(height: 13),
          Field(
            content: user.address,
            icon: 'assets/icons/gps-navigation.png',
            width: 26,
          ),
          SizedBox(height: 13),
          Field(
            content: formatDate(user.birthDate).toString(),
            icon: 'assets/icons/cake.png',
            width: 23,
          ),
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  final String content;
  final String icon;
  final double width;
  final double height;

  const Field({
    Key? key,
    required this.content,
    required this.icon,
    this.width = 25,
    this.height = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
      height: 53,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Image.asset(
              icon,
              width: width,
              height: height,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 22),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
