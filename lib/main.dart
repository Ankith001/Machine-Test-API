import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/model/dbdrinks.dart';
import 'package:machine_test/screen_main_page.dart';
import 'package:machine_test/services/service_one.dart';
import 'package:machine_test/view/authentication/login_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{ 
//   log("in main");
//    await ServiceOne().getMedDetails();
// print("after call");
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalDrinksAdapter()); 
  await Hive.openBox<LocalDrinks>('localdrinks');
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  User? user = FirebaseAuth.instance.currentUser;

    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      
        theme: ThemeData( 
          fontFamily: GoogleFonts.ubuntu().fontFamily, 
         primarySwatch: Colors.blue,
           appBarTheme: const AppBarTheme(
          color: Colors.white12,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
         
          
        ),
        ),
      home: user == null ?  ScreenLogin() : ScreenMainPage()
    );
  }
}

