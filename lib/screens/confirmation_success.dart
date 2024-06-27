import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmationSuccess extends StatelessWidget {
  const ConfirmationSuccess({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Confirmation Réussie',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35),
                Image(
                  image: AssetImage('assets/icons/check-mark.png'),
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 35),
                Text(
                  'Votre compte a été activé avec succès.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Se connecter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 106, 202, 179),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
