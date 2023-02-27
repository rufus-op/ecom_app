// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apple_store/screens/home_screen.dart';
import 'package:apple_store/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/api_provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 120, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Hero(
                //   tag: 'logo',
                //   child: Image(
                //     image: NetworkImage(
                //         'https://www.freepnglogos.com/uploads/apple-logo-png/file-apple-logo-black-svg-wikimedia-commons-1.png'),
                //     height: 100,
                //     width: 140,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Color(0xFffFBE30),
                    ),
                  ),
                  Text(
                    ' to the Course App',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ]),

                SizedBox(
                  height: 15,
                ),
                //enter username container
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Enter Name',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  },
                  controller: nameController,
                ),
                SizedBox(
                  height: 15,
                ),
                //enter email container
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Enter Email',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter E-mail";
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                //enter password container
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Enter Password',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    }
                    return null;
                  },
                  controller: passwordController,
                ),
                SizedBox(
                  height: 30,
                ),

                //login button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    Provider.of<ApiProvider>(context, listen: false).userName =
                        nameController.text;
                    Provider.of<ApiProvider>(context, listen: false)
                        .showLoading();

                    final newUser = await FirebaseAuthF().signUp(
                        emailController.text, passwordController.text, context);
                    // if (!mounted) return;

                    Provider.of<ApiProvider>(context, listen: false)
                        .dontshowLoading();
                    if (newUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(nameController.text),
                          ));
                    }
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    elevation: 0,
                    backgroundColor: Color(0xFffFBE30),
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  child: (Provider.of<ApiProvider>(context).isLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Create account',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account?'),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(thickness: 2),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      minimumSize: const Size(70, 70),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                    ),
                    child: const Image(
                      image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/281/281764.png',
                      ),
                      height: 50,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
