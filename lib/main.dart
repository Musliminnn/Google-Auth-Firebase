import 'package:flutter/material.dart';
import 'package:flutter_1/login/google_signin.dart';
import 'package:flutter_1/login/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: (MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
      )),
    );
  }
}
