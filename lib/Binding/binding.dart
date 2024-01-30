import 'package:firebase_tutorial/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LoginScreenController());
  }
}

class RegistrationScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationScreenController());
  }
}

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}