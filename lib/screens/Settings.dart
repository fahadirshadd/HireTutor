import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hire_tutor/NavBarKey.dart';
import 'package:hire_tutor/screens/HomePage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hire_tutor/services/auth.dart';
import 'package:hire_tutor/screens/LoginScreen.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdde6e8),
      child: Center(
        child: Column(
          children: [
            Text(
              'Settings',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 20,
            ),
            NeumorphicButton(
              onPressed: () {
                AuthMethods().signOut().then((s) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: Text('       Log Out       '),
            ),
          ],
        ),
      ),
    );
  }
}
