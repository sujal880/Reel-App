import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/text_input.dart';

import '../../widgets/glitch.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: GlithEffect(child: const Text("Welcome To TikTok",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)),
              ),
              SizedBox(height: 30),
              Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      pickimage();
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://st3.depositphotos.com/1767687/16607/v/450/depositphotos_166074422-stock-illustration-default-avatar-profile-icon-grey.jpg"),
                      radius: 60,
                    )
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                          child: Icon(Icons.edit,size: 20,color: Colors.black,)))
                ],
              ),
              SizedBox(height: 25),
              TextInputField(controller: emailController, myIcon: Icons.mail, mylabeltext: "Email", tohide: false),
              SizedBox(height: 20),
              TextInputField(controller: nameController, myIcon: Icons.person, mylabeltext: "Username", tohide: false),
              SizedBox(height: 20),
              TextInputField(controller: passwordController, myIcon: Icons.lock, mylabeltext: "Password", tohide: true),
              SizedBox(height: 20),
              TextInputField(controller: confirmpasswordController, myIcon: Icons.lock, mylabeltext: "Confirm Password", tohide: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                AuthController.instance.signUp(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim(), AuthController.instance.proimg);
              }, child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: Text("Sign Up")))
            ],
          ),
        ),
      ),
    );
  }
  pickimage(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pick Image From"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                AuthController.instance.pickImage(ImageSource.camera);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Select From Camera"),
            ),
            ListTile(
              onTap: (){
                AuthController.instance.pickImage(ImageSource.gallery);
              },
              leading: Icon(Icons.camera),
              title: Text("Select From Gallery"),
            )
          ],
        ),
      );
    });
  }
}
