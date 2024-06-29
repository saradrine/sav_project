import 'package:flutter/material.dart';
import 'package:sav_project/screens/add_vehicule_screen.dart';
import 'package:sav_project/widgets/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFF6F8FB),
        drawer: SideMenu(),
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/menu.png',
              width: 34,
              height: 34,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        body: AddVehiculeScreen());
  }
}
