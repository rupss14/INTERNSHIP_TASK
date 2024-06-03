import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskproject/ThirdPartyModels/UserModel.dart';

class GetUser extends StatefulWidget {
  const GetUser({super.key});

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
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
          title: Center(child: Text('Example1')),
        ),
        body: Column(
          children: [
            Expanded(
              //we hv to wrap the futurebuilder with expanded as the size of string greater than screen length
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
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
                                    ReusableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                    ReusableRow(title: 'Username', value: snapshot.data![index].username.toString()),
                                    ReusableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                                    ReusableRow(title: 'Address', value: snapshot.data![index].address!.geo!.lat.toString()),




                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ));
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

