import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DioTutorial(),
    );
  }
}

class DioTutorial extends StatefulWidget {
  const DioTutorial({super.key});

  @override
  State<DioTutorial> createState() => _DioTutorialState();
}

class _DioTutorialState extends State<DioTutorial> {

  String _getResponse = '';
  String _postResponse = '';

  void fetchGetJsonData() async{
    try {
      Dio dio = Dio();
      var response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      setState(() {
        _getResponse = json.encode(response.data);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void fetchPostJsonData() async{
    try {
      Dio dio = Dio();
      var response = await dio.post('https://jsonplaceholder.typicode.com/posts',
          data: {'name' : 'Huy', 'email' : 'quanghuy23122000@gmail.com'});
      setState(() {
        _postResponse = json.encode(response.data);
      });
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Dio Tutorial'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Button for getting request
              ElevatedButton(
                // method will be implemented later
                onPressed: fetchGetJsonData,
                child: const Text('Get Data/Get Response'),
              ),
              // To display the response of Get the request of screen
              Container(
                width: 300,
                padding: const EdgeInsets.all(15),
                child: Text(_getResponse),
              ),
              // Button for Post request
              ElevatedButton(
                // method will be implemented later
                onPressed: fetchPostJsonData,
                child: const Text('Post Data/Post Response'),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.all(15),
                child: Text(_postResponse),
              )
            ],
          )
        ),
      );
  }
}

