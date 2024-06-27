import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sav_project/screens/account_confirmation.dart';
import 'package:sav_project/screens/confirmation_failure.dart';
import 'package:sav_project/screens/confirmation_success.dart';
import 'package:sav_project/screens/layout.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: const Color.fromARGB(255, 246, 248, 251),
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 248, 251),
      ),
      debugShowCheckedModeBanner: false,
      home: const AccountConfirmation(),
    );
  }
}
