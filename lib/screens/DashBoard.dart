import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hire_tutor/InstructorsData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hire_tutor/HelperFunctions/SharedPreferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class _DashboardState extends State<Dashboard> {
  List<Widget> itemsData = [];
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getPostsData();
    getCurrentUser();

    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        SharedPreferenceHelper().saveUserEmail(loggedInUser!.email);

        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getPostsData() {
    List<dynamic> responseList = Instructors_Data;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Neumorphic(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 5,
          lightSource: LightSource.bottomRight,
        ),
        child: Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color(0xffdde6e8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post["name"],
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          post["brand"],
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${post["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Text(
                            post["serviceVia"],
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/${post["image"]}",
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '5.0 ⭐',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xfffdd835),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdde6e8),
      child: Column(
        children: [
          Text(
            'Home',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Subjects: ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    SubjectCards('Computer', '15 Instructors', Colors.blue,
                        'https://img.icons8.com/ios/452/my-computer--v2.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SubjectCards(
                        'Mathematics',
                        '25 Instructors',
                        Colors.redAccent,
                        'https://img.pngio.com/maths-multiple-multiplication-icon-with-png-and-vector-format-maths-png-512_512.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SubjectCards('Physics', '10 Instructors', Colors.orange,
                        'https://img.icons8.com/ios/452/physics.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SubjectCards(
                        'Chemistry',
                        '18 Instructors',
                        Colors.deepPurpleAccent,
                        'https://static.thenounproject.com/png/55633-200.png'),
                    SizedBox(
                      width: 20,
                    ),
                    SubjectCards('Biology', '14 Instructors', Colors.teal,
                        'http://cdn.onlinewebfonts.com/svg/img_535340.png'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Rated',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemCount: itemsData.length,
              itemBuilder: (context, index) {
                return itemsData[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectCards extends StatelessWidget {
  final String NameText;
  final String numberOfInstructors;
  final Color textColor;
  final String subjectIcon;
  SubjectCards(this.NameText, this.numberOfInstructors, this.textColor,
      this.subjectIcon);
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: 5,
        lightSource: LightSource.bottomRight,
      ),
      child: Container(
        width: 180,
        margin: EdgeInsets.only(right: 0),
        height: 111,
        decoration: BoxDecoration(
          color: Color(0xffdde6e8),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(subjectIcon),
                radius: 16,
              ),
              Text(
                NameText,
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                numberOfInstructors,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black26,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
