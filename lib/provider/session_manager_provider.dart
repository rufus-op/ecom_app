// ignore_for_file: use_build_context_synchronously

import 'package:apple_store/screens/login_screen.dart';
import 'package:apple_store/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager with ChangeNotifier {
  void sessionManager(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString('token') == null || sp.getString('token') == '') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FirstScreen(),
          ));
    }
  }
}
