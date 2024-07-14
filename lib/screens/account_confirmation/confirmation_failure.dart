import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmationFailure extends StatelessWidget {
  const ConfirmationFailure({Key? key}) : super(key: key);

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
                  'Échec de la confirmation',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                Image(
                    image: AssetImage(
                        'assets/icons/close-cross-in-circular-outlined-interface-button.png'),
                    width: 100,
                    height: 100,
                    color: Color.fromARGB(255, 93, 95, 102)),
                SizedBox(height: 35),
                Text(
                  'Nous n\'avons pas pu confirmer votre compte. Veuillez réessayer.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Réessayer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 239, 238),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(
                      fontSize: 16,
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
