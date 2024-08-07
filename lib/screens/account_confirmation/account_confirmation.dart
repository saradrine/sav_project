import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';

class AccountConfirmation extends StatelessWidget {
  const AccountConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Confirmation de Compte',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Image(
                  image: AssetImage('assets/icons/mailOutlined.png'),
                  width: 100,
                  height: 100,
                  color: Color.fromARGB(255, 93, 95, 102),
                ),
                SizedBox(height: 30),
                Text(
                  'Merci de vérifier votre adresse e-mail pour activer votre compte.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Text(
                  'Un e-mail de confirmation a été envoyé à :',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  'foulen@foulen.com',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Renvoyer l\'e-mail de confirmation'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 106, 202, 179),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Besoin d\'aide ? Contactez le support.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
