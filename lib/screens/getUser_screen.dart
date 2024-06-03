import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/GetUser.dart';

class getUser extends StatefulWidget {
  const getUser({super.key});

  @override
  State<getUser> createState() => _getUserState();
}

class _getUserState extends State<getUser> {
  List<Getuser> userList = [];

  Future<List<Getuser>> getUserApi() async {
    final response =
    await http.get(Uri.parse('https://astrobackend.edevlop.com/user'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(Getuser.fromJson(i));
      }

      return userList;
    } else {
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Users Page')),
        backgroundColor:Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            //we hv to wrap the futurebuilder with expanded as the size of string greater than screen length
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<Getuser>> snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else{
                    return ListView.builder(
                        itemCount:userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'success', value: snapshot.data![index].success.toString()),
                                  ReusableRow(title: 'message', value: snapshot.data![index].message.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.id.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.name.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.phoneNumber.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.gender.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.placeOfBirth.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.dateOfBirth.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.timeOfBirth.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.status.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.createdAt.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.user!.updatedAt.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}


class ReusableRow extends StatelessWidget {
  String title,value;
  ReusableRow({super.key,required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

