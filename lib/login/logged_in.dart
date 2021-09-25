import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/login/google_signin.dart';
import 'package:flutter_1/size_config.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  final _user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Profile",
          ),
          SizedBox(
            height: screenHeightResp(10),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(_user.currentUser.photoURL),
          ),
          SizedBox(
            height: screenHeightResp(10),
          ),
          Text("Name : ${_user.currentUser.displayName}"),
          SizedBox(
            height: screenHeightResp(10),
          ),
          Text("Gmail : ${_user.currentUser.email}"),
          SizedBox(
            height: screenHeightResp(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthResp(50),
            ),
            child: ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
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
