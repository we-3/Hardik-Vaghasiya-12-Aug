import 'package:flutter/material.dart';
import 'package:rbkei/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Shool Desk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: Home(
       ),
    );
  }

  static init() {}
}

