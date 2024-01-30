import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreenController extends GetxController
{
   var keys = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


}
class RegistrationScreenController extends GetxController
{

  var keyss = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController CpassController = TextEditingController();

}

class HomeScreenController extends GetxController
{

  Future<void> fetchDataAndStoreInFirebase() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> userList = data['data'];

      final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

      for (var user in userList) {
        await usersCollection.add({
          'id': user['id'],
          'email': user['email'],
          'first_name': user['first_name'],
          'last_name': user['last_name'],
          'avatar': user['avatar'],
        });
      }

    } else {
      throw Exception('Failed to load data from API');
    }
  }


}