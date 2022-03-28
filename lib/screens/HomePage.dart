import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hire_tutor/screens/Chats.dart';
import 'package:hire_tutor/screens/Courses.dart';
import 'package:hire_tutor/screens/Settings.dart';
import 'package:hire_tutor/screens/DashBoard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hire_tutor/NavBarKey.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> Screens = [Dashboard(), Chats(), MyCourses(), Settings()];
    return Scaffold(
      key: NavbarKey.getKey(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Color(0xffcfe0e3),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Chats'),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Courses'),
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            inactiveColor: Colors.black,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffdde6e8),
        leading: IconButton(
          icon: NeumorphicIcon(
            Icons.list,
            size: 28,
            style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 5,
                lightSource: LightSource.bottomRight,
                shadowDarkColor: Colors.black,
                shadowLightColor: Colors.white,
                color: Colors.black),
          ),
          onPressed: () {},
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: NeumorphicIcon(
              Icons.search,
              size: 28,
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 5,
                  lightSource: LightSource.bottomRight,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: NeumorphicIcon(
              Icons.person,
              size: 28,
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 5,
                  lightSource: LightSource.bottomRight,
                  shadowDarkColor: Colors.black,
                  shadowLightColor: Colors.white,
                  color: Colors.black),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Screens[currentIndex],
    );
  }
}

//CurvedNavigationBar(
//backgroundColor: Color(0xffdde6e8),
//color: Color(0xffc5dce0),
//letIndexChange: (index) => true,
//items: [
//NeumorphicIcon(
//Icons.home,
//size: 30,
//style: NeumorphicStyle(
//shape: NeumorphicShape.convex,
//boxShape:
//NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//depth: 5,
//lightSource: LightSource.bottomRight,
//shadowDarkColor: Colors.black,
//shadowLightColor: Colors.white,
//color: Colors.black),
//),
//NeumorphicIcon(
//Icons.message,
//size: 30,
//style: NeumorphicStyle(
//shape: NeumorphicShape.convex,
//boxShape:
//NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//depth: 5,
//lightSource: LightSource.bottomRight,
//shadowDarkColor: Colors.black,
//shadowLightColor: Colors.white,
//color: Colors.black),
//),
//NeumorphicIcon(
//Icons.apps,
//size: 30,
//style: NeumorphicStyle(
//shape: NeumorphicShape.convex,
//boxShape:
//NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//depth: 5,
//lightSource: LightSource.bottomRight,
//shadowDarkColor: Colors.black,
//shadowLightColor: Colors.white,
//color: Colors.black),
//),
//NeumorphicIcon(
//Icons.settings,
//size: 30,
//style: NeumorphicStyle(
//shape: NeumorphicShape.convex,
//boxShape:
//NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//depth: 5,
//lightSource: LightSource.bottomRight,
//shadowDarkColor: Colors.black,
//shadowLightColor: Colors.white,
//color: Colors.black),
//),
//],
//buttonBackgroundColor: Color(0xffc5dce0),
//index: currentIndex,
//onTap: (index) {
//setState(() {
//currentIndex = index;
//print('Index is: $index');
//});
//},
//animationCurve: Curves.easeInOut,
//animationDuration: const Duration(milliseconds: 250),
//),
