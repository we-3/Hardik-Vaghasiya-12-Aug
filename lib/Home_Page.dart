import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:rbkei/model/AppMenusModel.dart';
import 'package:rbkei/navigationbarpages.dart/account.dart';
import 'package:rbkei/navigationbarpages.dart/navhome.dart';
import 'package:rbkei/navigationbarpages.dart/notification.dart';
import 'package:rbkei/navigationbarpages.dart/privacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Home_Screen.dart';

void main() => runApp(Home_Page());

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'schooldesk',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SharedPreferences loginData;
  late String UserName;
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    notification(),
    privacy(),
    account(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 204, 0),
          title: Center(
            child: Image.asset(
              'assets/schooldesk.png',
              height: 35,
            ),
          )),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(
          () => _currentIndex = index,
        ),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Color.fromARGB(255, 255, 204, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
            activeColor: Color.fromARGB(255, 255, 204, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.policy_outlined),
            title: Text(
              'Privacy Policy',
            ),
            activeColor: Color.fromARGB(255, 255, 204, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text('Account'),
            activeColor: Color.fromARGB(255, 255, 204, 0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
