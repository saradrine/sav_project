import 'package:flutter/material.dart';
import 'package:sav_project/screens/signUp.dart';
import 'package:sav_project/theme/colors.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/auth/auth_prompt.dart';
import '../widgets/auth/auth_text_field.dart';
import '../widgets/auth/header_auth.dart';
import '../widgets/auth/welcome_text.dart';
// Constants

//Button
const kButtonHeight = 55.0;
const kButtonBorderRadius = 25.0;
const kAuthTextFieldBorderRadius = 50.0;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderAuth(context: context),
            _buildLoginForm(context),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      color: AppColors.kBaseColor,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.authBachkroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              WelcomeTextAuth(
                  title: 'Bienvenue!',
                  subtitle: 'Inscrivez-vous pour commencer'),
              SizedBox(height: 40),
              _buildEmailField(context),
              SizedBox(height: 20),
              _buildPasswordField(context),
              _buildForgotPasswordButton(),
              SizedBox(height: 30),
              AuthButton(
                text: 'Se connecter',
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid == true) {
                    // If the form is valid, proceed with the submission or further processing
                    print("Form is valid! Proceed with submission.");
                  }
                },
              ),
              AuthPrompt(
                  sentence: 'Vous débutez avec XXX?',
                  action: 'S’inscrire',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) => AuthTextField(
        label: "Adresse mail",
        hintText: "user@user.com",
        iconPath: 'assets/icons/mail.png',
        validatorMessage: 'Adresse mail obligatoire',
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains('@')) {
            return 'Veuillez entrer une adresse mail valide.';
          }
          return null;
        },
      );

  Widget _buildPasswordField(BuildContext context) => AuthTextField(
        label: "Mot de passe",
        hintText: "tapez votre mot de passe",
        iconPath: 'assets/icons/padlock.png',
        obscureText: _obscureText,
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Image.asset(
              _obscureText ? 'assets/icons/hide.png' : 'assets/icons/show.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        validatorMessage: 'Mot de passe obligatoire',
      );

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // Handle forgotten password
          },
          child: Text(
            'Mot de passe oublié?',
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
