import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/login/login.dart';
import 'package:flutter_1/size_config.dart';

class LoggedInEmail extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> _signOut() async{
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: screenHeightResp(400),
            width: screenWidthResp(400),
            child: Image.asset("assets/images/logged_in.png"),
          ),
          Text("Welcome"),
          Text("Email : ${_firebaseAuth.currentUser.email}"),
          SizedBox(
            height: screenHeightResp(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthResp(50),
            ),
            child: ElevatedButton(
              onPressed: () {
                _signOut().then(
                        (value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      );
              },
              child: Center(
                child: Text("Logout"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}