import 'package:flutter/material.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/field_input.dart' as FieldInput;
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_field.dart';
import '../../widgets/auth/header_auth.dart';
import '../../widgets/auth/welcome_text.dart';
import '../../widgets/auth/auth_prompt.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirmVisibility() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
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
            _buildSignUpForm(context),
          ],
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildSignUpForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
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
                  subtitle: 'Créez un compte pour continuer',
                ),
                SizedBox(height: 40),
                _buildLastNameField(context),
                SizedBox(height: 20),
                _buildFirstNameField(context),
                SizedBox(height: 20),
                _buildEmailField(context),
                SizedBox(height: 20),
                _buildNumTelField(context),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: _buildGenderField(context),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: _buildDateOfBirthField(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildEmploiField(context),
                SizedBox(height: 20),
                _buildAdresseField(context),
                SizedBox(height: 20),
                _buildPasswordField(context),
                SizedBox(height: 20),
                _buildConfirmPasswordField(context),
                SizedBox(height: 50),
                AuthButton(
                  text: 'S’inscrire',
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate();
                    if (isValid == true) {
                      // If the form is valid, proceed with the submission or further processing
                      print("Form is valid! Proceed with submission.");
                    }
                  },
                ),
                AuthPrompt(
                  sentence: 'Vous avez déjà un compte?',
                  action: 'Se connecter',
                  onPressed: () {},
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastNameField(BuildContext context) => AuthTextField(
        label: "Nom",
        hintText: "Nestor",
        iconPath: 'assets/icons/user.png',
        validatorMessage: 'Nom obligatoire',
      );

  Widget _buildFirstNameField(BuildContext context) => AuthTextField(
        label: "Prénom",
        hintText: "François",
        iconPath: 'assets/icons/user.png',
        validatorMessage: 'Prénom obligatoire',
      );

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

  Widget _buildNumTelField(BuildContext context) => AuthTextField(
        label: "Numéro de téléphone",
        hintText: "+216 55 555 555",
        iconPath: 'assets/icons/mobile-phone.png',
        validatorMessage: 'Numéro de téléphone obligatoire',
        textInputType: TextInputType.phone,
      );

  Widget _buildGenderField(BuildContext context) {
    return FieldInput.FieldInput(
      label: 'Sexe',
      widgetType: FieldInput.WidgetType.DropDownInputStyling,
      items: ['Féminin', 'Masculin'],
      borderRadius: 50,
      applyBoxShadow: false,
    );
  }

  Widget _buildDateOfBirthField(BuildContext context) {
    return FieldInput.FieldInput(
      label: 'Date de naissance',
      widgetType: FieldInput.WidgetType.DateInputStyling,
      icon: 'cake.png',
      height: 25,
      width: 25,
      borderRadius: 50,
      applyBoxShadow: false,
    );
  }

  Widget _buildEmploiField(BuildContext context) => AuthTextField(
        label: "Emploi",
        hintText: "Ingénieur",
        iconPath: 'assets/icons/suitcase.png',
        validatorMessage: 'Emploi obligatoire',
      );

  Widget _buildAdresseField(BuildContext context) => AuthTextField(
        label: "Adresse",
        hintText: "rue --- ben arous, Tunisie",
        iconPath: 'assets/icons/gps-navigation.png',
        validatorMessage: 'Adresse obligatoire',
        textInputType: TextInputType.streetAddress,
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

  Widget _buildConfirmPasswordField(BuildContext context) => AuthTextField(
        label: "Confirmez le mot de passe",
        hintText: "confirmez votre mot de passe",
        iconPath: 'assets/icons/padlock.png',
        obscureText: _obscureConfirmText,
        suffixIcon: GestureDetector(
          onTap: _toggleConfirmVisibility,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Image.asset(
              _obscureConfirmText
                  ? 'assets/icons/hide.png'
                  : 'assets/icons/show.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        validatorMessage: 'Confirmation du mot de passe obligatoire',
      );
}
