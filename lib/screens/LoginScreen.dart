import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hire_tutor/screens/HomePage.dart';
import 'package:hire_tutor/constants.dart';
import 'package:hire_tutor/screens/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  String email = '';

  String password = '';

  bool showSpinner = false;

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
                  'Login',
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
                      print('Password: $password');
                    },
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Password...',
                    ),
                    autofocus: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                NeumorphicButton(
                  child: Text('       Login       '),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
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
                        showSpinner = true;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      Text('Don\'t have an account?'),
                      GestureDetector(
                        child: Text(
                          ' Create Account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                          print('Create Account Pressed.');
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
