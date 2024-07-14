import 'package:flutter/material.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/profile/change_pwd_form.dart';
import 'package:sav_project/widgets/profile/profile_fields.dart';
import 'package:sav_project/widgets/profile/profile_form.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var user = User(
    firstName: 'Abderrahmen Abderrahmen Abderrahmen',
    lastName: 'Doe',
    email: 'foulen@gmail.com',
    phone: '12345678',
    job: 'Développeur',
    address: 'Tunis',
    birthDate: DateTime(1999, 12, 31),
  );

  bool _isEditing = false;

  void _openChangePasswordOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => ChangePwdForm());
  }

  void toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _isEditing
            ? ProfileForm(
                toggleEditing: toggleEditing,
                fields: [
                  ProfileFieldDetail(
                    label: 'Prénom:',
                    icon: 'user.png',
                    widgetType: WidgetType.TextInputStyling,
                    content: user.firstName,
                    width: 26,
                  ),
                  ProfileFieldDetail(
                    label: 'Nom:',
                    icon: 'user.png',
                    widgetType: WidgetType.TextInputStyling,
                    content: user.lastName,
                    width: 26,
                  ),
                  ProfileFieldDetail(
                    label: 'Email:',
                    icon: 'email.png',
                    widgetType: WidgetType.TextInputStyling,
                    content: user.email,
                    width: 23,
                  ),
                  ProfileFieldDetail(
                    label: 'Téléphone:',
                    icon: 'mobile-phone.png',
                    widgetType: WidgetType.PhoneInputStyling,
                    content: user.phone,
                  ),
                  ProfileFieldDetail(
                    label: 'Emploi:',
                    icon: 'suitcase.png',
                    widgetType: WidgetType.TextInputStyling,
                    content: user.job,
                    width: 23,
                  ),
                  ProfileFieldDetail(
                    label: 'Adresse:',
                    icon: 'gps-navigation.png',
                    widgetType: WidgetType.TextInputStyling,
                    content: user.address,
                    width: 26,
                  ),
                  ProfileFieldDetail(
                    label: 'Date de naissance:',
                    icon: 'cake.png',
                    widgetType: WidgetType.DateInputStyling,
                    content: formatDate(user.birthDate).toString(),
                    width: 23,
                    inProfile: true,
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 16,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: toggleEditing,
                          child: Text(
                            "Modifier Profil",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ProfileFields(user: user),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: _openChangePasswordOverlay,
                      child: Text(
                        "Changer mot de passe",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Layout(initialIndex: 1),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Mes véhicules",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10),
                              ImageIcon(
                                AssetImage('assets/icons/arrowV.png'),
                                size: 20,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 40, 40, 40),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
