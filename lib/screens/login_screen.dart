import 'package:apple_store/provider/api_provider.dart';
import 'package:apple_store/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                // Logo here
                // const Hero(
                //   tag: 'logo',
                //   child: Image(
                //     image: NetworkImage(
                //         'https://www.freepnglogos.com/uploads/apple-logo-png/file-apple-logo-black-svg-wikimedia-commons-1.png'),
                //     height: 100,
                //     width: 140,
                //   ),
                // ),

                const SizedBox(
                  height: 18,
                ),
                Row(children: const [
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

                const SizedBox(
                  height: 10,
                ),
                //enter username container
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Enter Email',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //enter password container
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Enter Password',
                    labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
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
                ),
                const SizedBox(
                  height: 30,
                ),

                //login button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }

                    Provider.of<ApiProvider>(context, listen: false)
                        .showLoading();
                    final newUser = await FirebaseAuthF().signIn(
                        emailController.text, passwordController.text, context);
                    // if (!mounted) return;
                    Provider.of<ApiProvider>(context, listen: false)
                        .dontshowLoading();
                    if (newUser != null) {
                      Navigator.pushNamed(context, '/home');
                    }
                    // else {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text('Something Went Wrong!')));
                    // }
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color(0xFffFBE30),
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  child: (Provider.of<ApiProvider>(context).isLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
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
