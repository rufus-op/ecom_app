import 'package:apple_store/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hello',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'SignUp',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.length <= 8) {
                    print('object');
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
