import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String profilePhoto;
  String email;
  String uid;

  UserModel(
      {
        required this.name,
        required this.email,
        required this.profilePhoto,
        required this.uid
      }
      );

  //App - Firebase(Map)
  Map<String , dynamic> toJson() => {
    "name" : name,
    "profilePic" : profilePhoto,
    "email" : email,
    "uid" : uid
  };


  static UserModel fromSnap( DocumentSnapshot snap){

    var snapshot = snap.data() as Map<String , dynamic>;
    return UserModel(
        email: snapshot['email'],
        profilePhoto: snapshot["profilePic"],
        uid: snapshot["uid"],
        name: snapshot["name"]
    );

  }

}