import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/GetUser.dart';

class deleteUser extends StatefulWidget {
  const deleteUser({super.key});

  @override
  State<deleteUser> createState() => _deleteUserState();
}

class _deleteUserState extends State<deleteUser> {
  List<Getuser> deletelist = [];

  Future<List<Getuser>> deleteApi() async {
    final response = await http.delete(Uri.parse('https://astrobackend.edevlop.com/user/delete'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        deletelist.add(Getuser.fromJson(i));
      }

      return deletelist;
    } else {
      return deletelist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            //we hv to wrap the futurebuilder with expanded as the size of string greater than screen length
            child: FutureBuilder(
                future: deleteApi(),
                builder: (context, AsyncSnapshot<List<Getuser>> snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else{
                    return ListView.builder(
                        itemCount:deletelist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'success', value: snapshot.data![index].success.toString()),
                                  ReusableRow(title: 'message', value: snapshot.data![index].message.toString()),
                                 ]
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

