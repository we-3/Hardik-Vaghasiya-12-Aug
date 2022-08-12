import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alert extends StatefulWidget {
  const alert({ Key? key }) : super(key: key);

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.fitWidth,
            ),
          )
    ))
    );
  }
}