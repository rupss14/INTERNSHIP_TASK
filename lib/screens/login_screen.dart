import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' ;
import 'package:taskproject/screens/otpverification_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController=TextEditingController();


  Future<dynamic> login(String phoneNumber) async{
    try{
      Response response=await post(
          Uri.parse('https://astrobackend.edevlop.com/user/login'),
          body:{
            'phoneNumber':phoneNumber,
          }
      );

      if(response.statusCode == 201){
        var data=jsonDecode(response.body.toString());

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => otpVerificationScreen()));

        return data;
      }
      else{
        print('failed');
      }
    }
    catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF99ddff),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size:80,
                color:Colors.white,
              ),
              const SizedBox(height :25),

              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'USER LOGIN',
                    textStyle: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                      color:Colors.white,
                    ),
                    speed: const Duration(milliseconds: 400),
                  ),
                ],),

              const SizedBox(height :50),

              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38,
                      spreadRadius: 20.0,
                      blurRadius: 20.0,
                    ),
                  ]
                ),
                child: TextFormField(
                  style: TextStyle(

                  ),
                  controller: phoneNumberController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((12)),
                      ),
                      hintText: 'Phone Number',
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),


              GestureDetector(
                onTap: (){
                  login(phoneNumberController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Login',
                    style:TextStyle(
                      fontSize: 18,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
