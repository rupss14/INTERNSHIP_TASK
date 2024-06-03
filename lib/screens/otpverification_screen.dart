import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' ;
import 'package:taskproject/screens/getUser_screen.dart';

class otpVerificationScreen extends StatefulWidget {
  const otpVerificationScreen({super.key});

  @override
  State<otpVerificationScreen> createState() => _otpVerificationScreenState();
}

class _otpVerificationScreenState extends State<otpVerificationScreen> {

  TextEditingController otpcontroller=TextEditingController();



  Future<dynamic> otpverify(String otp) async{
    try{
      Response response=await post(
          Uri.parse('https://astrobackend.edevlop.com/user/verify'),
          body:{
            'otp':otp,
          }
      );

      if(response.statusCode == 201){

        var data=jsonDecode(response.body.toString());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => getUser()));
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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OTP Verification',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 35.0,
            ),),
            SizedBox(
              height: 50,
            ),
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
                controller: otpcontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((12)),
                  ),
                  hintText: 'Enter OTP',
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),


            GestureDetector(
              onTap: (){
                otpverify(otpcontroller.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Verify OTP',
                    style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
