import 'package:flutter/material.dart';

class policy extends StatefulWidget {
  const policy({ Key? key }) : super(key: key);

  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
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