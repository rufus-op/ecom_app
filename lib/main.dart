import 'package:apple_store/provider/api_provider.dart';
// import 'package:apple_store/provider/cart_provider.dart';

import 'package:apple_store/screens/login_screen.dart';
// import 'package:apple_store/screens/payments/payment_screen.dart';
// import 'package:apple_store/screens/product_screen.dart';
// import 'package:apple_store/screens/signup_screen.dart';
import 'package:apple_store/services/firebase_auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => CartProvider(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.black))),
        // initialRoute: '/register',
        home: StreamBuilder(
          stream: FirebaseAuthF().auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FirstScreen();
            } else {
              return LoginPage();
            }
          },
        ),

        // routes: {
        //   '/home': (context) =>
        //       HomeScreen(Provider.of<ApiProvider>(context).userName),
        //   '/register': (context) => RegisterPage(),
        //   // '/product': (context) => ProductScreen(),
        //   '/payment': (context) => PaymentScreen(),
        //   // '/cart': (context) =>  CartScreen(),
        // },
      ),
    );
  }
}
