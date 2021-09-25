import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/login/logged_in.dart';
import 'package:flutter_1/login/login.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return LoggedIn();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong!"),
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
