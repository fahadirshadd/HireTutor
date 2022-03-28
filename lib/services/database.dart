import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  addUserInfoToDB(
      {String? userID,
      String? email,
      String? username,
      String? name,
      String? profileUrl}) {
    FirebaseFirestore.instance.collection("users").doc(userID).set({
      "email": email,
      "username": username,
      "name": name,
      "imgUrl": profileUrl
    });
  }
}
