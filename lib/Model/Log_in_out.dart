import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthModel extends ChangeNotifier {
  bool isLoggedIn = false;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
