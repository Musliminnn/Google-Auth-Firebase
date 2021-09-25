import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/login/google_signin.dart';
import 'package:flutter_1/login/logged_in_email.dart';
import 'package:flutter_1/signup/signup.dart';
import 'package:flutter_1/size_config.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passVisible = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidthResp(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: screenHeightResp(70),
              ),
              Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              Text(
                "Sign In to Continue!",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
              SizedBox(
                height: screenHeightResp(41),
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
              SizedBox(
                height: screenHeightResp(10),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFFF4F4F4),
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidthResp(25),
                      right: screenWidthResp(10),
                    ),
                    child: LineIcon.envelope(
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ),
                  hintText: "Type your email",
                  hintStyle: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),
                maxLines: 1,
              ),
              SizedBox(
                height: screenHeightResp(20),
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
              SizedBox(
                height: screenHeightResp(10),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFFF4F4F4),
                  filled: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidthResp(25),
                      right: screenWidthResp(10),
                    ),
                    child: LineIcon.lock(
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ),
                  hintText: "Type your password",
                  hintStyle: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black.withOpacity(0.25),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidthResp(20),
                      right: screenWidthResp(20),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _passVisible = !_passVisible;
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _passVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ),
                  ),
                ),
                obscureText: _obscureText,
                maxLines: 1,
              ),
              SizedBox(
                height: screenHeightResp(60),
              ),
              Center(
                child: Text(
                  "Or Connect With",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeightResp(15),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  child: Container(
                    height: screenHeightResp(55),
                    width: screenWidthResp(135),
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidthResp(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/google.png",
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: screenWidthResp(10),
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeightResp(20),
              ),
              InkWell(
                onTap: () async {
                  try {
                    await _firebaseAuth
                        .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        )
                        .then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoggedInEmail(),
                            ),
                          ),
                        );
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Harap Masukan Email/Password yang Valid')),
                    );
                  }
                  ;
                },
                child: Hero(
                  tag: "button",
                  child: Container(
                    height: screenHeightResp(60),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF158EFD),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeightResp(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Colors.black.withOpacity(0.75)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
