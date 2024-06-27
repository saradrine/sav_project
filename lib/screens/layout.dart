import 'package:flutter/material.dart';
import 'package:sav_project/screens/home.dart';
import 'package:sav_project/screens/profile.dart';
import 'package:sav_project/widgets/bottom_navbar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  List pages = [
    Home(),
    Profile(),
    Profile(),
    Profile(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    print(index);
    print(pages[index]);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
