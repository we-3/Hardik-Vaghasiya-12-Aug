// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// Future<void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
// SharedPreferences prefs = await SharedPreferences.getInstance();
// Response response = await post(
//           Uri.parse('https://mtestsd.rbkei.in/api/PublicInformation?LastUpdateOn=02-02-2000&AppVersion=103'));
// print(Response);
// runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: http.Response == null ? splash() : bottomNavBar()));
// }

// splash() {
// }

// bottomNavBar() {
// }
  

 
// class public_information extends StatefulWidget {
//   const public_information({Key? key}) : super(key: key);

//   @override
//   State<public_information> createState() => _public_informationState();
// }

// class _public_informationState extends State<public_information> {
//   var futurePost;

//   @override
//   void initState() {
//     super.initState();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Public Information',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color.fromARGB(255, 255, 204, 0),
        
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 255, 204, 0),
//           title: Text('Public Information'),
//         ),
//         body: FutureBuilder<String>(
//           future: futurePost,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, index) => Container(
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     padding: EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                       color: Color(0xff97FFFF),
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${snapshot.data![index].length}",
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text("${snapshot.data![index].characters}"),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             } else {
//               return Center(
//                   child: CircularProgressIndicator(
//                 color: Colors.amber,
//               ));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class public_information extends StatefulWidget {
  const public_information({ Key? key }) : super(key: key);

  @override
  State<public_information> createState() => _public_informationState();
}

class _public_informationState extends State<public_information> {
  

  String token = "";

  @override
  void initState() {
    getToken();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token")!;
    
    setState((){
      
    });
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}