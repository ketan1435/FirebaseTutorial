import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/Controller/controller.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Firebase API Task',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: FutureBuilder(
        future:homeScreenController.fetchDataAndStoreInFirebase(),
        builder:(context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final userData = documents[index].data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(userData['avatar']),
                            ),
                            title: Text('${userData['first_name']} ${userData['last_name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(userData['email']),
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