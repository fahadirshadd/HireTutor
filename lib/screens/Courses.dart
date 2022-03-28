import 'package:flutter/material.dart';

class MyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdde6e8),
      width: 500,
      child: Center(
        child: Column(
          children: [
            Text(
              'Courses',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
