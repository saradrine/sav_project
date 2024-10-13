import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sav_project/providers/auth_provider.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/theme/colors.dart';
import 'package:sav_project/widgets/auth/auth_button.dart';
import 'package:sav_project/widgets/auth/auth_text_field.dart';
import 'package:sav_project/widgets/auth/header_auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderAuth(context: context),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
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
                    _buildEmailField(context),
                    SizedBox(height: 40),
                    AuthButton(
                      text: 'Envoyer un mail',
                      onPressed: () async {
                        final email = emailController.text;

                        final isValid = _formKey.currentState?.validate();
                        print("Form validation result: $isValid");

                        if (isValid == true) {
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .forgotPassword(context, email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Veuillez vérifier votre boîte mail pour réinitialiser votre mot de passe.'),
                              duration: Duration(seconds: 3),
                            ),
                          );
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

  Widget _buildEmailField(BuildContext context) => AuthTextField(
        controller: emailController,
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
}
