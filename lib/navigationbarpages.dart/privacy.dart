import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbkei/policypages/Account.dart';
import 'package:rbkei/policypages/alert.dart';
import 'package:rbkei/policypages/more.dart';
import 'package:rbkei/policypages/policy.dart';

class privacy extends StatefulWidget {
  const privacy({ Key? key }) : super(key: key);

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    more(),
    alert(),
    more(),
    policy(),
    Account(),
  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
     var tabselected;
    return new Scaffold(
      resizeToAvoidBottomInset: false,
    
      
      body: _children[_currentIndex],
      
      bottomNavigationBar: BottomNavyBar(
        
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 35,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index,),
        
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.bars),
            title: Text('More'),
            activeColor: Color.fromARGB(255, 0, 15, 90),
            
            textAlign: TextAlign.center,
          ),


          BottomNavyBarItem(
            icon: Icon(Icons.shield),
            title: Text('Policy'),
            activeColor: Color.fromARGB(255, 0, 15, 90),
            textAlign: TextAlign.center,
          ),


          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.solidBell),
            title: Text(
              'Alert',
            ),
            activeColor: Color.fromARGB(255, 0, 15, 90),
            textAlign: TextAlign.center,
          ),


          BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.book),
            title: Text('Notice Board'),
            activeColor: Color.fromARGB(255, 0, 15, 90),
            textAlign: TextAlign.center,
          ),


           BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.solidCircleUser),
            title: Text(
              'Account',
            ),
            activeColor: Color.fromARGB(255, 0, 15, 90),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}