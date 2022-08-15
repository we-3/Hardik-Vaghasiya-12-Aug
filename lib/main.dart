import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:rbkei/home.dart';

import 'Pages/announcement_screen.dart';

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
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home:Home(),
    );
  }

  static init() {}
}

