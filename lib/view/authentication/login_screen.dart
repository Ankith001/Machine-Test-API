import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:machine_test/constants.dart';
import 'package:machine_test/screen_main_page.dart';
import 'package:machine_test/view/authentication/widgets/text_form_field.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Login Screen",
                style: TextStyle(fontSize: 28),
              ),
              kHeight20,
              FormFieldWidget(
                text: "Email ID",
                controller: emailController,
              ),
              FormFieldWidget(
                text: "Password",
                controller: passwordController,
              ),
              kHeight20,
              ElevatedButton(
                  onPressed: () async {
                    log('h');
                    try{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ScreenMainPage(),), (route) => false); }
                   catch(e){
                    Get.snackbar("Invalid", "error$e"); 
                   }
                  },
                  child: Text("Click"))
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: TextButton(
              //     onPressed: () {
              //       print("object");
              //       //Get.to(ScreenMainPage());
              //       // print(emailController
              //       //     .text); //  authFunction(emailController, passwordController);
              //     },
              //     child: const Text("LOG IN", style: TextStyle()),
              //     style: TextButton.styleFrom(
              //       primary: Colors.white,
              //       elevation: 5,
              //       backgroundColor: kRedColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

authFunction(email, password) async {
  print("123");
  try {
    print("object1");
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Get.to(ScreenMainPage());
  } catch (e) {
    print("object2");
    print("error$e");
  }
}
