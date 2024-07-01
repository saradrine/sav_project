import 'package:flutter/material.dart';
import 'package:sav_project/screens/add_vehicule_screen.dart';
import 'package:sav_project/screens/appointment.dart';
import 'package:sav_project/screens/home.dart';
import 'package:sav_project/screens/notifications.dart';
import 'package:sav_project/screens/profile.dart';
import 'package:sav_project/widgets/bottom_navbar.dart';
import 'package:sav_project/widgets/navigation_drawer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  int _lastIndex = 0;
  bool _inNotifPage = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List pages = [
    Home(),
    Notifications(),
    //History(),
    AddVehiculeScreen(),
    Appointment(),
    Profile(),
  ];

  final List<String> titles = [
    'Acceuill',
    'Notifications',
    'Ajouter véhicule',
    'Rendez-vous',
    'Profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _lastIndex = index;
      _inNotifPage = false;
    });
  }

  void _onNotifPage() {
    setState(() {
      _selectedIndex = 1;
      _inNotifPage = true;
    });
  }

  void _onBack() {
    setState(() {
      _selectedIndex = _lastIndex;
      _inNotifPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      appBar: _inNotifPage
          ? PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: AppBar(
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icons/arrow.png',
                        width: 37,
                        height: 37,
                      ),
                      onPressed: _onBack,
                    ),
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: AppBar(
                  title: Text(
                    titles[_selectedIndex],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icons/menu.png',
                        width: 37,
                        height: 37,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        icon: ImageIcon(
                          AssetImage('assets/icons/bellOutlined.png'),
                          size: 32,
                        ),
                        color: Colors.black,
                        onPressed: _onNotifPage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        onTap: _onItemTapped,
        currentIndex: _lastIndex,
      ),
    );
  }
}
