import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' ;


class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController placeofBirthController = TextEditingController();
  TextEditingController dateofBirthController = TextEditingController();
  TextEditingController timeofBirthController = TextEditingController();
  TextEditingController statusController = TextEditingController();


 Future<dynamic> updatedata(String name, String gender, String placeofBirth,
      String dateofBirth, String timeofBirth, String status) async {
    try {
      Response response = await put(
          Uri.parse('https://astrobackend.edevlop.com/user/update'),
          body: {
            'name': name,
            'gender': gender,
            'placeofBirth': placeofBirth,
            'dateofBirth': dateofBirth,
            'timeofBirth': timeofBirth,
            'status': status
          }
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data;
      }
      else {
        print('failed');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Name'
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: genderController,
              decoration: InputDecoration(
                hintText: 'Your Gender',
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: placeofBirthController,
              decoration: InputDecoration(
                hintText: 'place of Birth',
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: dateofBirthController,
              decoration: InputDecoration(
                hintText: 'datee of Birth',
              ),
            ),

            SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: timeofBirthController,
              decoration: InputDecoration(
                hintText: 'time of Birth',
              ),
            ),


            SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: statusController,
              decoration: InputDecoration(
                hintText: 'Your Status',
              ),
            ),

            SizedBox(
              height: 40.0,
            ),

            GestureDetector(
              onTap: () {
                updatedata(
                    nameController.text.toString(),
                    genderController.text.toString(),
                    placeofBirthController.text.toString(),
                    dateofBirthController.text.toString(),
                    timeofBirthController.text.toString(),
                    statusController.text.toString()
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}