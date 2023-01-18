import 'package:flutter/material.dart';
class AlbumRotator extends StatefulWidget {
  String profilePicUrl;
  AlbumRotator({Key? key,required this.profilePicUrl}) : super(key: key);

  @override
  State<AlbumRotator> createState() => _AlbumRotatorState();
}

class _AlbumRotatorState extends State<AlbumRotator>with SingleTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 5));
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0,end: 1.0).animate(controller),
      child: SizedBox(
        height: 70,
        width: 70,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey,
                  Colors.white
                ]),
                borderRadius: BorderRadius.circular(35)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image(image: NetworkImage("https://tasko.in/wp-content/uploads/2018/08/avatar_smart_guy-512.png"),fit: BoxFit.cover,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
