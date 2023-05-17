import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  var _jsonArray= [];
  String url='https://jsonplaceholder.typicode.com/posts';
  void getData() async{
    

    try {
      final response=await get(Uri.parse(url));
    final jsonData=jsonDecode(response.body);
    //print(jsonData);

     setState(() {
      _jsonArray=jsonData;
    });
      
    } catch (e) {
      print(e.toString());
    }

  }

  @override
  void initState()
  {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ListView.builder(
          itemCount: _jsonArray.length,
          itemBuilder:(context,index){
            final post=_jsonArray[index];
            return Text('title: ${post['title']}\n Body: ${post['body']}\n\n\n');
          } ),
      )
    );
  }
}