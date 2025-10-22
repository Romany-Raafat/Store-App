import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: Center(
          child: TextButton(
            onPressed: () async {
             
            },
            child: Text("Pressed"),
          ),
        ),
      ),
    );
  }
}
