import 'package:firebase_tutorial/Controller/controller.dart';
import 'package:firebase_tutorial/Screen/registration_screen.dart';
import 'package:firebase_tutorial/Utils/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  RegistrationScreenController registrationScreenController = Get.put(RegistrationScreenController());
  LoginScreenController loginScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    var meadiaQuery = MediaQuery.of(context);
    return
      Scaffold(
          backgroundColor:Colors.white,
          body: Column(
            children: [
              SizedBox(height:240,),
              Form(
                key:loginScreenController.keys,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                      child: TextFormField(
                        controller:loginScreenController.emailController,
                        decoration:InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid
                              )
                          ),
                        ),
                        validator: (value){
                          if (value!.isEmpty)
                          {
                            return "Please Enter the Username";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                      child: TextFormField(
                        controller:loginScreenController.passController,
                        decoration:InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                    style: BorderStyle.solid
                                )
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Please Enter the Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: (){
                          if(loginScreenController.keys.currentState!.validate())
                          {
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return Container(
                                    child: AlertDialog(
                                      title: Text("Login Sucessful"),
                                      actions: [
                                        Center(
                                          child: TextButton(
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: Text('ok'),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                        child: Container(
                          height: meadiaQuery.size.height*0.055,
                          width: meadiaQuery.size.width*0.3,
                          decoration: BoxDecoration(
                              color: Colors.orange.shade800,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                              child: Text("Login",style:TextHelper.h5.copyWith(color:Colors.white),)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    RichText(
                        text:TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an Account??",style: TextHelper.h7
                            ),
                            TextSpan(
                              recognizer:TapGestureRecognizer()..onTap=(){
                                 Get.to(RegistrationScreen());
                            },
                              text: " Register Here",style: TextHelper.h7.copyWith(color:Colors.orange.shade800,fontWeight: FontWeight.bold)
                            )
                          ]
                        )
                    )
                  ],
                ),
              )
            ],
          )
      );
  }
}
