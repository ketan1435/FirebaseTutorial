import 'package:firebase_tutorial/Controller/controller.dart';
import 'package:firebase_tutorial/Screen/login_Screen.dart';
import 'package:firebase_tutorial/Utils/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  LoginScreenController loginScreenController = Get.put(LoginScreenController());
  RegistrationScreenController registrationScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    var meadiaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor:Colors.white,
        body: Column(
          children: [
            Text("Ketan"),
            SizedBox(height:190,),
            Form(
              key:registrationScreenController.keyss,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                    child: TextFormField(
                      controller: registrationScreenController.emailController,
                      decoration:InputDecoration(
                          labelText: "Username",
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
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                    child: TextFormField(
                      controller: registrationScreenController.passController,
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
                        if (value!.isEmpty)
                        {
                          return "Please Enter the Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                    child: TextFormField(
                      controller:registrationScreenController.CpassController,
                      decoration:InputDecoration(
                          labelText: "Confirm Password",
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
                        if (value!.isEmpty)
                        {
                          return "Please Confirm Your Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: (){
                        if(registrationScreenController.keyss.currentState!.validate())
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
                        width: meadiaQuery.size.width*0.35,
                        decoration: BoxDecoration(
                            color: Colors.orange.shade800,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                            child: Text("Registration",style: TextHelper.h6.copyWith(color:Colors.white),)),
                      ),
                    ),
                  ),
                  RichText(
                      text:TextSpan(
                          children: [
                            TextSpan(
                                text: "Already have an Account??",style: TextHelper.h7
                            ),
                            TextSpan(
                                recognizer:TapGestureRecognizer()..onTap=(){
                                  Get.to(LoginScreen());
                                },
                                text: " Login Here",style: TextHelper.h7.copyWith(color:Colors.orange.shade800,fontWeight: FontWeight.bold)
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
