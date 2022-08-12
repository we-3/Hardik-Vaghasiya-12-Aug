import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rbkei/Home_Page.dart';
import 'package:rbkei/api/google_signin_api.dart';
import 'package:rbkei/main.dart';
import 'package:rbkei/register.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Register_with_Otp.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Home extends StatefulWidget {
  static Future init() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    }
  }

  @override
  State<Home> createState() => _HomeState();
}
///////////////////////Sign in With Google//////////////////////////////
googleLogin() async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  try {
    var result = await _googleSignIn.signIn();
    print(result);
  } catch (error) {
    print(error);
  }
}

Future signIn() async {
  final user = await GoogleSignInApi();
}
var UserName;
  var password;
  var SerialNumber;
  var SessionHostId;
  var HostMAC;
  var HostName;
  var LastSeen;
  var LocalIP;
  var LoginProvider;
  var key;
  var ProviderKey;
  var PublicIP;
  void Google(
      String UserName,
      Password,
      SerialNumber,
      SessionHostId,
      HostName,
      HostMAC,
      LoginProvider,
      ProviderKey,
      LastSeen,
      PublicIP,
      LocalIP,
      key) async {
    // ignore: unused_local_variable
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      Response response = await post(
          Uri.parse('https://mtestsd.rbkei.in/api/LoginWithSocialNetworking'),
          body: {
            'UserName': UserName,
            'Password': Password,
            'SerialNumber': SerialNumber,
            'SessionHostId': SessionHostId,
            'HostName': HostName,
            'HostMAC': HostMAC,
            'LoginProvider': LoginProvider,
            'ProviderKey': ProviderKey,
            'LastSeen': LastSeen,
            'PublicIP': PublicIP,
            'LocalIP': LocalIP,
            'key': key
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);

        print('Login');
      } else {
        print('failed');
      }
      } catch (e) {
      print(e.toString());
    }
  }

late SharedPreferences loginData;

class _HomeState extends State<Home> {
  bool isHiddenPassword = true;
  GlobalKey <FormState> formkey = GlobalKey<FormState>();

  late SharedPreferences localStorage;
  
  ///////////////////////Login Api//////////////////////////

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_aldready_login();
  }

    var UserName;
    var password;
    var SerialNumber;
    var SessionHostId;
    var HostMAC;
    var HostName;
    var LastSeen;
    var LocalIP;
    var LoginProvider;
    var NotificationToken;
    var ProviderKey;
    var PublicIP;

    void login(
        String UserName,
        Password,
        SerialNumber,
        SessionHostId,
        HostName,
        HostMAC,
        LoginProvider,
        ProviderKey,
        LastSeen,
        PublicIP,
        LocalIP,
        NotificationToken) async {
      // ignore: unused_local_variable
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      try {
        Response response = await post(
            Uri.parse('https://mtestsd.rbkei.in/api/CreateTokan'),
            body: {
              'UserName': UserName,
              'Password': Password,
              'SerialNumber': SerialNumber,
              'SessionHostId': SessionHostId,
              'HostName': HostName,
              'HostMAC': HostMAC,
              'LoginProvider': LoginProvider,
              'ProviderKey': ProviderKey,
              'LastSeen': LastSeen,
              'PublicIP': PublicIP,
              'LocalIP': LocalIP,
              'NotificationToken': NotificationToken
            });

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          print(data);

          print('Login');
        } else {
          print('failed');
        }

      // final pref = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   'UserName': UserName,
      //   'Password': Password,
      //   'SerialNumber': SerialNumber,
      //   'SessionHostId': SessionHostId,
      //   'HostName': HostName,
      //   'HostMAC': HostMAC,
      //   'LoginProvider': LoginProvider,
      //   'ProviderKey': ProviderKey,
      //   'LastSeen': LastSeen,
      //   'PublicIP': PublicIP,
      //   'LocalIP': LocalIP,
      //   'NotificationToken': NotificationToken,
      // });
      // pref.setString(userData, userData);
      // print('check' + userData.toString());
    } catch (e) {
      print(e.toString());
    }
  }

 
////////////////////////////Login Api End////////////////////////////////

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 255, 204, 0),
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    // ignore: unused_element
    Future hideBar() async =>
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.top]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                  top: 25.0,
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
                        height: 80.0,
                        width: 120.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'SCHOOL DESK',
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(fontSize: 18, letterSpacing: 5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: AutoSizeText(
                          'Login',
                          style: TextStyle(fontSize: 20, letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),

                  ///////////////////*Email*/////////////////
                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 27),
                    decoration: const BoxDecoration(),
                    
                    child: TextFormField(
                      key: formkey,
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
                      cursorColor: Color.fromARGB(255, 255, 204, 0),
                      decoration: InputDecoration(
                        labelText: 'Your E-mail',
                        hintText: 'abc@gmail.com',
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27),
                            borderSide: BorderSide(color: Colors.black45)),
                      ),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: "Requires @gmail.com"),
                          EmailValidator(errorText: "Wrong Email"),
                        ]
                      ),
                    ),
                  ),

                  ////////////////////*Password*////////////////////

                  Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 27),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      cursorColor: Color.fromARGB(255, 255, 204, 0),
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                          hoverColor: Color.fromARGB(255, 255, 204, 0),
                          labelText: 'Password:',
                          hintText: '****',
                          
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(Icons.visibility)),
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle:
                              TextStyle(color: Colors.black45, fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
                          ),
                          
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(27),
                              borderSide: BorderSide(color: Colors.black45)),
                            ),
                          validator: MinLengthValidator(6, errorText: "At least 6 Character"),    
                    ),
                  ),

                  /////////////////////// Login Button //////////////////////////////
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap:  () async {
                                            
                      var data;
                      
                      login(
                        usernameController.text.toString(),
                        passwordController.text.toString(),
                        SerialNumber.toString(),
                        SessionHostId.toString(),
                        HostName.toString(),
                        HostMAC.toString(),
                        LoginProvider.toString(),
                        ProviderKey.toString(),
                        LastSeen.toString(),
                        PublicIP.toString(),
                        LocalIP.toString(),
                        NotificationToken.toString(),
                      );
                      String UserName = usernameController.text;
                      String password = passwordController.text;
                      if (UserName != '' && password != '') {
                        print('Successfull');
                        loginData.setBool('data', false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_Page()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 204, 0),
                            borderRadius: BorderRadius.circular(27)),
                        child: Center(
                          child: Text('Login'),
                        ),
                        height: 50,
                      ),
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

                  ///////////////* google and facebook button*//////////////////

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0, right: 120.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(225, 255, 255, 255),
                        onPrimary: Colors.lightBlueAccent,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        // minimumSize: Size(0, 50),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      label: Text(
                        'Sign-In',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onPressed: googleLogin,
                    ),
                  ),
////////////////////////////////////////////////////////////////////////////////
                  TextButton(
                    child: Text(
                      "Dont have an account? Register",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 204, 0)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => register()),
                      );
                    },
                  ),

                  ////////////////////////////////OTP Login//////////////////////////////////
                  Container(
                    child: TextButton(
                      child: Text(
                        "Register Using OTP",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(bottom: 30.0),
                        primary: Colors.blueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register_with_Otp()),
                        );
                      },
                    ),
                  ),
////////////////////////////////Privacy Policy//////////////////////////////////////////
                  SizedBox(
                    child: Container(
                      child: TextButton(
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 38.0),
                          primary: Colors.blueAccent,
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
//////////////////password icon view start///////////////////
  void _togglePasswordView(){
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }else{
      isHiddenPassword = true;
    }
    setState(() {
      
    });
  }
  //////////////////password icon view end///////////////////

  void check_if_aldready_login() async {
    loginData = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

save() async{
  await MyApp.init();
  var usernameController;
  var localStorage;
  localStorage.setString('username', usernameController.text.toString());
  var passwordController;
  localStorage.setString('password', passwordController.text.toString());

}
