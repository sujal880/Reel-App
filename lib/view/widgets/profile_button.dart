import 'package:flutter/material.dart';
class ProfileButton extends StatefulWidget {
  String profilePhotoUrl;
  ProfileButton({Key? key,required this.profilePhotoUrl}) : super(key: key);

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Positioned(
              left: 5,
              child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(image: NetworkImage("https://tasko.in/wp-content/uploads/2018/08/avatar_smart_guy-512.png"),fit: BoxFit.cover),
            ),
          ))
        ],
      ),
    );
  }
}
