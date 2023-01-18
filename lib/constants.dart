import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/screens/add_video_screen.dart';
import 'package:tiktok_clone/view/screens/display_screen.dart';
import 'package:tiktok_clone/view/screens/profile_screen.dart';
import 'package:tiktok_clone/view/screens/search_screen.dart';

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

const backgroundColor=Colors.black;
var buttonColor=Colors.red[400];
const borderColor=Colors.grey;
var pageindex = [
  DisplayVideo_Screen(),
  SearchScreen(),
  addVideoScreen(),
  Text('Coming Soon In New Updates!'),
  ProfileScreen(),
];