import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/provider/session_manager_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).getUsers();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Provider.of<SessionManager>(context, listen: false)
          .sessionManager(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
