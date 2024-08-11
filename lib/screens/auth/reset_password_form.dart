import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/auth_provider.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/auth/auth_button.dart';
import 'package:sav_project/widgets/auth/auth_text_field.dart';
import 'package:sav_project/widgets/auth/header_auth.dart';

class ResetPasswordForm extends StatefulWidget {
  final String token;

  ResetPasswordForm({required this.token});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            _buildResetForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildResetForm(BuildContext context) {
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
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 36,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Entrez votre adresse mail pour réinitialiser le mot de passe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                      if (authProvider.errorMessage != null) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              authProvider.errorMessage!,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }
                      return SizedBox(height: 40);
                    }),
                    _buildPasswordField(context),
                    SizedBox(height: 40),
                    AuthButton(
                      text: 'Envoyer un mail',
                      onPressed: () async {
                        final password = passwordController.text;
                        final confirmPassword = confirmPasswordController.text;

                        final isValid = _formKey.currentState?.validate();
                        print("Form validation result: $isValid");

                        if (isValid == true) {
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .resetPassword(context, widget.token, password,
                                  confirmPassword);
                        } else {
                          print(
                              "Form is invalid! Cannot proceed with submission.");
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Besoin d\'aide ? Contactez le support.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) => AuthTextField(
        controller: passwordController,
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
        controller: confirmPasswordController,
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
        validatorMessage: 'Mot de passe obligatoire',
      );
}
