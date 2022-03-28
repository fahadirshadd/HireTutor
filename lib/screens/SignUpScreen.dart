import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hire_tutor/screens/HomePage.dart';
import 'package:hire_tutor/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdde6e8),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicText(
                  'Sign Up',
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    depth: 3,
                    lightSource: LightSource.bottomRight,
                    color: Colors.blue,
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  child: Text(
                    'Email:',
                    style: TextStyle(color: Colors.black54),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 10,
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(24)),
                    depth: 3,
                    lightSource: LightSource.bottomRight,
                    color: Color(0xffdde6e8),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                      print('Email: $email');
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email...',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  child: Text(
                    'Password:',
                    style: TextStyle(color: Colors.black54),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 10,
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(24)),
                    depth: 3,
                    lightSource: LightSource.bottomRight,
                    color: Color(0xffdde6e8),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                      print('Paasowrd: $password');
                    },
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password...',
                    ),
                    autofocus: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                NeumorphicButton(
                  child: Text('       Create Account       '),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final NewUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (NewUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Text('Already have an account?'),
                      GestureDetector(
                        child: Text(
                          ' Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          print('Login Pressed.');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
