
import 'package:flutter/material.dart';

class more extends StatefulWidget {
  const more({ Key? key }) : super(key: key);

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
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