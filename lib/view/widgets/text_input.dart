import 'package:flutter/material.dart';

import '../../constants.dart';
class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String mylabeltext;
  final bool tohide;
  TextInputField({Key? key,required this.controller,required this.myIcon,required this.mylabeltext,required this.tohide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: tohide,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(myIcon),
          labelText: mylabeltext,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
    );
  }
}
