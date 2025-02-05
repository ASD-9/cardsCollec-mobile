import 'package:flutter/material.dart';
import 'package:mobile_app/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  AuthProvider(this._authService);

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;
  bool _isLoading = false;
  String? _error;
  bool _isAuthenticated = false;

  bool get isUsernameValid => _isUsernameValid;
  bool get isPasswordValid => _isPasswordValid;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  void validateUsername(String username) {
    _isUsernameValid = username.isNotEmpty && username.length >= 3;
    notifyListeners();
  }

  void validatePassword(String password) {
    final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    _isPasswordValid = password.isNotEmpty && regex.hasMatch(password);
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (!_isUsernameValid || !_isPasswordValid) {
      _error = !isUsernameValid ? "Nom d'utilisateur requis (3 caractères minimum)" : "Mot de passe requis (8 caractères minimum, une majuscule, une minuscule, un chiffre et un caractère spécial)";
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await _authService.login(username: username, password: password);
      _isAuthenticated = true;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      await _authService.logout();
      _isAuthenticated = false;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkAuthStatus() async {
    final token = await _authService.getRefreshToken();
    _isAuthenticated = token != null;
    notifyListeners();
    return _isAuthenticated;
  }
}
