import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widgets/glitch.dart';

import '../../widgets/text_input.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: GlithEffect(child: const Text("TikTok",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)),
          ),
          SizedBox(height: 30),
          TextInputField(controller: emailController,myIcon: Icons.mail,mylabeltext: "Email",tohide: false),
          SizedBox(height: 20),
          TextInputField(controller: passwordController,myIcon: Icons.lock,mylabeltext: "Password",tohide: true),
          SizedBox(height: 30),
          ElevatedButton(onPressed: (){
            AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
          }, child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: Text("Login")))
        ],
      ),
    );
  }
}
