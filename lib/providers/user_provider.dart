import 'package:flutter/material.dart';

class MyAccountDetails with ChangeNotifier {
  Map user = {};

  void loginUser(Map userData) {
    user = userData;
  }

  get currentUser {
    return user;
  }
}
