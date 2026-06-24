import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  SharedPreferences? _prefs;
  // In-memory storage for users (username -> password)
  Map<String, String> _users = {};
  // Currently logged in user
  String? _currentUser;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final usersString = _prefs?.getString('users');
    if (usersString != null) {
      _users = Map<String, String>.from(json.decode(usersString));
    }
    _currentUser = _prefs?.getString('currentUser');
  }

  String? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  // Register a new user
  Future<bool> register(String username, String password) async {
    if (_users.containsKey(username)) {
      return false; // User already exists
    }
    _users[username] = password;
    await _prefs?.setString('users', json.encode(_users));
    return true;
  }

  // Login a user
  Future<bool> login(String username, String password) async {
    if (_users.containsKey(username) && _users[username] == password) {
      _currentUser = username;
      await _prefs?.setString('currentUser', username);
      return true;
    }
    return false;
  }

  // Logout current user
  Future<void> logout() async {
    _currentUser = null;
    await _prefs?.remove('currentUser');
  }
}
