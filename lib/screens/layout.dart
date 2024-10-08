import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/notifications_provider.dart';
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
  final int? specialPageIndex;

  const Layout({super.key, this.initialIndex = 0, this.specialPageIndex});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  int _lastIndex = 0;
  int _indOfSpecialPage = -1;
  bool _inSpecialPage = false;
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
    if (widget.specialPageIndex != null) {
      _tappedSpecialPage(widget.specialPageIndex!);
    }
  }

  void _tappedSpecialPage(int index) {
    setState(() {
      _indOfSpecialPage = index;
      _selectedIndex = index;
      _inSpecialPage = true;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _lastIndex = index;
      _indOfSpecialPage = -1;
      _inSpecialPage = false;
    });
  }

  void _onNotifPage() {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: false);
    notificationProvider.markAllAsRead(context);
    _tappedSpecialPage(6);
  }

  void _onBack() {
    setState(() {
      _selectedIndex = _lastIndex;
      _indOfSpecialPage = -1;
      _inSpecialPage = false;
    });
  }

  void _onDrawerItemTapped(String title) {
    int? index = drawerTitleToPageIndex[title];
    if (index != null) {
      if (index > 4) {
        _tappedSpecialPage(index);
      } else {
        _onItemTapped(index);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasNewNotification =
        context.watch<NotificationProvider>().hasNewNotification;

    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(
        selectedMenu: titles[_selectedIndex],
        onMenuItemTapped: _onDrawerItemTapped,
      ),
      appBar: _inSpecialPage
          ? PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: AppBar(
                  title: Text(
                    titles[_indOfSpecialPage],
                    style: TextStyle(
                      fontSize: 23,
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
                        width: 25,
                        height: 25,
                      ),
                      onPressed: _onBack,
                    ),
                  ),
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: AppBar(
                  title: Text(
                    titles[_selectedIndex],
                    style: TextStyle(
                      fontSize: 23,
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
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        children: [
                          IconButton(
                            icon: ImageIcon(
                              AssetImage('assets/icons/bellOutlined.png'),
                              size: 28,
                            ),
                            color: Colors.black,
                            onPressed: _onNotifPage,
                          ),
                          if (hasNewNotification)
                            Positioned(
                              right: 9,
                              top: 9,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
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
