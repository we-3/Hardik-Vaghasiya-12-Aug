import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 255, 204, 0),
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.png'))),
          child: ListView(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                    width: 30,
                  ),
                  Image.asset(
                    'assets/bee.png',
                    height: 110.0,
                    width: 120.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'SCHOOL DESK',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, letterSpacing: 5),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, letterSpacing: 2),
                    ),
                  ),
                ],
              ),

              //////////////////  /*Email*/   ////////////////
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 27),
                decoration: const BoxDecoration(),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Your E-mail',
                    hintText: 'abc@gmail.com',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                    ),
                  ),
                ),
              ),

              ////////////////////*Password*////////////////////

              Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 27),
                decoration: const BoxDecoration(),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'UID / Employee Code',
                    hintText: 'UID / Employee Code',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                    ),
                  ),
                ),
              ),

              //////////////////////**Login button*/////////////////////////////

              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 35,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 204, 0),
                    elevation: 1,
                    minimumSize: const Size(70, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    'Credential Login',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ),

              ////////////////////////////////***////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Cant Login?',
                        style: TextStyle(color: Colors.black54)),
                    TextSpan(
                        text: ' Forgot Password',
                        style: TextStyle(color: Colors.blueAccent)),
                  ]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Login With',
                        style: TextStyle(color: Colors.black)),
                  ]),
                ),
              ),

              //////////////////* google and facebook button*//////////////////

              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/google.png'),
                    ),
                  ),
                ),
              ),

              ////////////////////////////////OTP Login//////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: ' Register Using OTP',
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
