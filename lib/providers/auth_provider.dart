import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sav_project/enum/sexe.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/screens/account_confirmation/account_confirmation.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/screens/layout.dart';
import 'package:sav_project/services/auth_service.dart';
import 'dart:async';

class AuthProvider extends ChangeNotifier {
  final _storage = FlutterSecureStorage();
  String? _token;
  User? _user;
  String? _errorMessage;

  String? get token => _token;
  User? get user => _user;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await _storage.read(key: 'token');
    notifyListeners();
  }

  Future<void> _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> _removeToken() async {
    await _storage.delete(key: 'token');
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      final authData =
          await AuthService().login(context, email: email, password: password);

      final accessToken = authData['accessToken'];
      final userJson = authData['user'];

      if (accessToken == null || userJson == null) {
        throw Exception("Received null values for accessToken or user");
      }

      _token = accessToken;
      _user = User.fromJson(userJson);

      if (_token != null && _user != null) {
        print("Login successful, user: $_user");
        _errorMessage = null;
        await _saveToken(_token!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Layout()),
        );
      }
      notifyListeners();
    } catch (e) {
      if (e is Exception) {
        if (e.toString().contains('Coordonnées invalides')) {
          _errorMessage = 'Coordonnées invalides';
        } else if (e.toString().contains('Utilisateur non trouvé')) {
          _errorMessage = 'Utilisateur non trouvé';
        } else if (e.toString().contains('Adresse mail non vérifiée')) {
          _errorMessage = 'Adresse mail non vérifiée';
        } else {
          _errorMessage = 'Une erreur est survenue';
        }
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();

      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await AuthService().logout(context);
      _token = null;
      _user = null;
      await _removeToken();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
      notifyListeners();
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  Future<void> register(
    BuildContext context,
    String nom,
    String prenom,
    String email,
    String password,
    int cin,
    String telephone,
    String adresse,
    Sexe sexe,
    DateTime dateNaissance,
    String emploi,
  ) async {
    try {
      final authData = await AuthService().registerClient(
        context,
        nom: nom,
        prenom: prenom,
        email: email,
        password: password,
        cin: cin,
        telephone: telephone,
        adresse: adresse,
        sexe: sexe,
        dateNaissance: dateNaissance,
        emploi: emploi,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AccountConfirmation(email: email);
          },
        ),
      );
      notifyListeners();
    } catch (e) {
      if (e is Exception) {
        if (e
            .toString()
            .contains('Email, mot de passe et cin sont obligatoires'))
          _errorMessage = 'Email, mot de passe et cin sont obligatoires';
        else if (e.toString().contains('Email ou cin déjà existant'))
          _errorMessage = 'Email ou cin déjà existant';
        else {
          _errorMessage = 'Une erreur est survenue';
        }
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();
      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
      print('Error registering: $e');
    }
  }

  Future<void> resendVerificationEmail(
      BuildContext context, String email) async {
    try {
      await AuthService().resetVerificationToken(context, email: email);
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      if (e is Exception) {
        if (e.toString().contains('Utilisateur non trouvé'))
          _errorMessage = 'Utilisateur non trouvé';
        else if (e.toString().contains('Compte déjà verifé'))
          _errorMessage = 'Compte déjà verifé';
        else {
          _errorMessage = 'Une erreur est survenue';
        }
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();
      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
      print('Error resending verification email: $e');
    }
  }

  Future<bool> verifyEmail(
      BuildContext context, String token, String email) async {
    try {
      bool result =
          await AuthService().verifyEmail(context, token: token, email: email);
      notifyListeners();
      return result;
    } catch (e) {
      // Handle the error appropriately
      if (e.toString().contains('Utilisateur non trouvé')) {
        _errorMessage = 'Utilisateur non trouvé';
      } else if (e.toString().contains('Le token de vérification a expiré')) {
        _errorMessage = 'Le token de vérification a expiré';
      } else if (e.toString().contains('Compte déjà verifé')) {
        _errorMessage = 'Compte déjà verifé';
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();
      Timer(Duration(seconds: 10), () {
        _errorMessage = null;
        notifyListeners();
      });
      return false;
    }
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    try {
      await AuthService().forgotPassword(context, email: email);
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      if (e is Exception) {
        if (e.toString().contains('Utilisateur non trouvé'))
          _errorMessage = 'Utilisateur non trouvé';
        else {
          _errorMessage = 'Une erreur est survenue';
        }
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();
      // Set a timer to clear the error message after 5 seconds
      Timer(Duration(seconds: 5), () {
        _errorMessage = null;
        notifyListeners();
      });
    }
  }

  Future<bool> resetPassword(BuildContext context, String token,
      String password, String confirmPassword) async {
    try {
      bool result = await AuthService().resetPassword(context,
          token: token, password: password, confirmPassword: confirmPassword);
      notifyListeners();
      return result;
    } catch (e) {
      // Handle the error appropriately
      if (e.toString().contains('Token invalide')) {
        _errorMessage = 'Token invalide';
      } else if (e.toString().contains('Le token a expiré')) {
        _errorMessage = 'Le token a expiré';
      } else if (e
          .toString()
          .contains('Les mots de passe ne correspondent pas')) {
        _errorMessage = 'Les mots de passe ne correspondent pas';
      } else if (e
          .toString()
          .contains('Le mot de passe doit contenir au moins 8 caractères')) {
        _errorMessage = 'Le mot de passe doit contenir au moins 8 caractères';
      } else {
        _errorMessage = 'Une erreur est survenue';
      }
      notifyListeners();
      Timer(Duration(seconds: 10), () {
        _errorMessage = null;
        notifyListeners();
      });
      return false;
    }
  }
}
