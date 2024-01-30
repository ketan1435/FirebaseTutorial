import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/Controller/controller.dart';
import 'package:firebase_tutorial/Utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenController homeScreenController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   homeScreenController.fetchDataAndStoreInFirebase();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.orange.withOpacity(0.8),
        title: Center(
            child: Text('Firebase API Task',style:TextHelper.h3)),
      ),
      body: FutureBuilder(
        future:homeScreenController.fetchDataAndStoreInFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final List<DocumentSnapshot> informations = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: informations.length,
                  itemBuilder: (context, index) {
                    final userInformation = informations[index].data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Container(
                        height: mediaQuery.size.height*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green.withOpacity(0.3),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(userInformation['avatar']),
                            ),
                            title: Text('${userInformation['first_name']} ${userInformation['last_name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(userInformation['email']),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}