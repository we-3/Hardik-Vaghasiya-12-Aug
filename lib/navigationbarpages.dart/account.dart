import 'package:flutter/material.dart';
import 'package:rbkei/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class account extends StatefulWidget {
  const account({ Key? key }) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  late SharedPreferences loginData;
  late String UserName;


    @override
  void initState(){
    super.initState();
    initial();
      
  }

  void initial()async{
    loginData = await SharedPreferences.getInstance();
    setState(() {
      UserName = loginData.getString('UserName')!;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        // child: Container(
          
        //   child: Icon(Icons.logout,size: 25,color: Colors.red,)
        //       onPressed : (){
        //         loginData.setBool('login', true);
        //         Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Home()));
        //       }
        // ),
      
              
         
    
          
        

      
            child: ElevatedButton.icon(
          icon: Icon(
            
            Icons.logout,
            color: Colors.white,
            size: 24.0,
          ),
          label: Text('LOGOUT'),
          onPressed: () {
            loginData.setBool('login', true);
            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Home()));
          },
          style: ElevatedButton.styleFrom(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ))
    );
      

     
  }
}