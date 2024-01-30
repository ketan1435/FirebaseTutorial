import 'package:firebase_tutorial/Binding/binding.dart';
import 'package:firebase_tutorial/Routs/routs.dart';
import 'package:firebase_tutorial/Screen/home_screen.dart';
import 'package:firebase_tutorial/Screen/login_Screen.dart';
import 'package:firebase_tutorial/Screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppPages {

  static final INITIALROUTE = Routs.HOMESCREEN;

  static final Pages =[

    GetPage(
        name: Routs.LOGINSCREEN,
        page: ()=>LoginScreen()
    ),

    GetPage(
        name: Routs.REGISTRATIONSCREEN,
        page: ()=>RegistrationScreen()
    ),

    GetPage(
        name: Routs.HOMESCREEN,
        page: ()=>HomeScreen(),
        binding:HomeScreenBinding()
    ),

  ];
}