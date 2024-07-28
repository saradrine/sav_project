import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/auth_provider.dart';
import 'package:sav_project/theme/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
    required this.selectedMenu,
    required this.onMenuItemTapped,
  });

  final String selectedMenu;
  final Function(String) onMenuItemTapped;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String selectedMenu = 'Accueil';
  final List<Map<String, dynamic>> listElements = [
    {'icon': 'home.png', 'title': 'Accueil'},
    {'icon': 'car.png', 'title': 'Mes véhicules'},
    {'icon': 'addFull.png', 'title': 'Nouveau véhicule'},
    {'icon': 'calendar.png', 'title': 'Rendez-vous'},
    {'icon': 'history.png', 'title': 'Historique'},
    {'icon': 'user.png', 'title': 'Profil'},
    {'icon': 'bell.png', 'title': 'Notifications'},
    {'icon': 'settings.png', 'title': 'Paramètres'},
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(25),
      ),
      child: Drawer(
        backgroundColor: Colors.white,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              width: 310,
              height: double.infinity,
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      InfoCard(
                        name: 'Rym Drine',
                        email: 'foulen@foulen.com',
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Divider(
                                color: Color(0xFF969696),
                                height: 1,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ...listElements.map((element) {
                              return ListElement(
                                icon: element['icon'],
                                title: element['title'],
                                press: () {
                                  setState(() {
                                    widget.onMenuItemTapped(element['title']);
                                    selectedMenu = element['title'];
                                  });
                                  // Navigator.pushNamed(context, '/');
                                },
                                isActive:
                                    widget.selectedMenu == element['title'],
                                // element['title'] == 'Nouveau véhicule',
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      ListElement(
                        icon: 'logout.png',
                        title: 'Déconnexion',
                        press: () async {
                          setState(() {
                            selectedMenu = 'Déconnexion';
                          });
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .logout(context);
                        },
                        isActive: widget.selectedMenu == 'Déconnexion',
                        // isActive: selectedMenu == 'Déconnexion',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListElement extends StatelessWidget {
  const ListElement(
      {Key? key,
      required this.icon,
      required this.title,
      required this.press,
      required this.isActive})
      : super(key: key);

  final String icon, title;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Material(
        color: isActive ? AppColors.kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: InkWell(
          onTap: press,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: 53,
            child: ListTile(
              leading: Image.asset(
                'assets/icons/' + icon,
                width: isActive ? 34 : 32,
                height: isActive ? 34 : 32,
                color: isActive ? Colors.white : null,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: isActive ? 17 : 16,
                ),
              ),
              contentPadding: EdgeInsets.only(left: 30, right: 0),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        email,
        style: TextStyle(fontSize: 12),
      ),
      contentPadding: EdgeInsets.only(left: 30, right: 0),
    );
  }
}
