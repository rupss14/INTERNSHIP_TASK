import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:taskproject/Models/getAccessTokenModel.dart';
import 'package:http/http.dart' as http;

class getAccessToken extends StatefulWidget {
  const getAccessToken({super.key});

  @override
  State<getAccessToken> createState() => _getAccessTokenState();
}

class _getAccessTokenState extends State<getAccessToken> {

  List<GetAccessTokenModel> tokenList = [];

  Future<List<GetAccessTokenModel>> getUserApi() async {
    final response =
    await http.get(Uri.parse('https://astrobackend.edevlop.com/user'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        tokenList.add(GetAccessTokenModel.fromJson(i));
      }

      return tokenList;
    } else {
      return tokenList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Token Screen')),
        backgroundColor:Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            //we hv to wrap the futurebuilder with expanded as the size of string greater than screen length
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<GetAccessTokenModel>> snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  else{
                    return ListView.builder(
                        itemCount:tokenList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'success', value: snapshot.data![index].success.toString()),
                                  ReusableRow(title: 'message', value: snapshot.data![index].message.toString()),
                                  ReusableRow(title: 'data', value: snapshot.data![index].data!.accessToken.toString()),
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