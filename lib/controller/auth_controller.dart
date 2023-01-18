import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/usermodel.dart';
import 'package:tiktok_clone/view/screens/auth_screens/login_screen.dart';
import 'package:tiktok_clone/view/screens/auth_screens/signup_screen.dart';

import '../view/screens/homescreen.dart';

class AuthController extends GetxController {
  static AuthController instance=Get.find();
  File? proimg;

  pickImage(ImageSource imageSource)async{
    try{
      final photo=await ImagePicker().pickImage(source: imageSource);
      if(photo==null)return;
      final tempimage=File(photo.path);
        proimg=tempimage;
        log("Selected");
    }catch(ex){
      log(ex.toString());
    }
  }

  late Rx<User?> _user;
  User get user=>_user.value!;
  @override
  void onReady() {
    super.onReady();
    _user=Rx<User?>(FirebaseAuth.instance.currentUser); // Rx Observable Keyword
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }
  _setInitialView(User? user){
    if(user==null){
      Get.offAll(()=>SignUpScreen());
    }
    else{
      Get.offAll(()=>HomeScreen());
    }
  }

  void signUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadurl=await _uploadProPic(image);
        UserModel userModel=UserModel(uid: credential.user!.uid, email: email, name: username, profilePhoto: downloadurl);
        await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set(userModel.toJson());
        log("User Created");
        Get.off(()=>HomeScreen());
      }
      else{
        Get.snackbar("Error In Creating Account", "Please Enter All Required Fields");
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
      Get.snackbar("${ex.code.toString()}", ex.code.toString());
    }
  }

  void login(String email,String password)async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }
      else{
        Get.snackbar("Error Logging in", "Please Enter Required Fields");
      }
    }on FirebaseAuthException catch(ex){
      Get.snackbar("Error", ex.code.toString());
    }
  }
}

Future<String> _uploadProPic(File image) async {
  Reference reference = FirebaseStorage.instance
      .ref()
      .child("profilepictures")
      .child(FirebaseAuth.instance.currentUser!.uid);
  UploadTask uploadTask = reference.putFile(image);
  TaskSnapshot taskSnapshot = await uploadTask;
  String imagedwnURL = await taskSnapshot.ref.getDownloadURL();
  return imagedwnURL;
}
