import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sav_project/enum/sexe.dart';
import 'package:sav_project/models/user.dart';
import 'package:sav_project/screens/auth/login.dart';
import 'package:sav_project/screens/home.dart';
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
    BuildContext context, {
    required String nom,
    required String prenom,
    required String email,
    required String password,
    required int cin,
    required String telephone,
    required String adresse,
    required Sexe sexe,
    required DateTime dateNaissance,
    required String emploi,
  }) async {
    try {
      final authData = await AuthService().registerSuperAdmin(
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
      _token = authData['token'];
      notifyListeners();
    } catch (e) {
      print('Error registering: $e');
    }
  }
}
