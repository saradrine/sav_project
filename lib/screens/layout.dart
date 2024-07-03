import 'package:flutter/material.dart';
import 'package:sav_project/screens/add_vehicule.dart';
import 'package:sav_project/screens/appointment.dart';
import 'package:sav_project/screens/home.dart';
import 'package:sav_project/screens/my_vehicules.dart';
import 'package:sav_project/screens/notifications.dart';
import 'package:sav_project/screens/profile.dart';
import 'package:sav_project/widgets/bottom_navbar.dart';
import 'package:sav_project/widgets/navigation_drawer.dart';
import 'package:sav_project/screens/historique.dart';
import 'package:sav_project/screens/settings.dart';

class Layout extends StatefulWidget {
  final int initialIndex;

  const Layout({super.key, this.initialIndex = 0});

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
    MyVehicules(),
    AddVehicule(),
    Appointment(),
    Profile(),
    Historique(),
    Notifications(),
    Settings(),
  ];

  final List<String> titles = [
    'Accueil',
    'Mes véhicules',
    'Nouveau véhicule',
    'Rendez-vous',
    'Profil',
    'Historique',
    'Notifications',
    'Paramètres',
  ];

  final Map<String, int> drawerTitleToPageIndex = {
    'Accueil': 0,
    'Mes véhicules': 1,
    'Nouveau véhicule': 2,
    'Rendez-vous': 3,
    'Profil': 4,
    'Historique': 5,
    'Notifications': 6,
    'Paramètres': 7,
  };

  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _lastIndex = widget.initialIndex;
  }

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

  void _onDrawerItemTapped(String title) {
    int? index = drawerTitleToPageIndex[title];
    if (index != null) {
      setState(() {
        _selectedIndex = index;
        _lastIndex = index;
        _inNotifPage = false;
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(
        selectedMenu: titles[_selectedIndex],
        onMenuItemTapped: _onDrawerItemTapped,
      ),
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
