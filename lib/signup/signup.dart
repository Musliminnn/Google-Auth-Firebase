import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/login/login.dart';
import 'package:flutter_1/size_config.dart';
import 'package:line_icons/line_icon.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passVisible = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                  "Create Account,",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
                Text(
                  "Sign Up to Get Started!",
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
                  "Username",
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
                  controller: _userController,
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
                      child: LineIcon.user(
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ),
                    hintText: "Type your username",
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
                  validator: (value) {
                    if (!(EmailValidator.validate(value))) {
                      return "Masukan Format Email dengan Benar";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value.length < 6 || value.isEmpty) {
                      return "Password Minimal 6 Huruf";
                    }
                    return null;
                  },
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
                  height: screenHeightResp(45),
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      await _firebaseAuth
                          .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          )
                          .then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ),
                          );
                    }
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
                          "Sign Up",
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
                      "Already have an account?",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.black.withOpacity(0.75)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      ),
                      child: Text(
                        "Sign In",
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
      ),
    );
  }
}
