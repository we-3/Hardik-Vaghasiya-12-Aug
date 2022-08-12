import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rbkei/model/api_model.dart';
import 'package:rbkei/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class portfolios extends StatefulWidget {
  const portfolios({Key? key}) : super(key: key);

  @override
  State<portfolios> createState() => _portfoliosState();
}

// class Data {
//   final int ID;
//   final int MenuName;
//   final String MenuUrlPath;
//   final String Employee;
//   final String MenuIconName;
//   final String Student;

//   Data({
//     required this.ID,
//     required this.MenuName,
//     required this.MenuUrlPath,
//     required this.Employee,
//     required this.MenuIconName,
//     required this.Student,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//       ID: json["ID"],
//       MenuName: json["MenuName"],
//       MenuUrlPath: json["MenuUrlPath"],
//       Employee: json["Employee"],
//       MenuIconName: json["MenuIconName"],
//       Student: json["Student"]);

// }

class _portfoliosState extends State<portfolios> {
  late String stringResponse;
  late Map mapResponse;
  late Map dataResponse;
  List? listResponse;

  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://project.rbkei.org/SchoolDesk/SDAppMenus.json"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        dataResponse = mapResponse['Data'];
      });
    }
  }
//   // List _ = [];
//   var ID;

//   var MenuName;

//   var Employee;

  // var MenuUrlPath;

  // var MenuIconName;

  // var Student;
  // late List<Data> model;

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 204, 0),
        elevation: 0.5,
        title: Padding(
            padding: const EdgeInsets.all(65.0),
            child: Text(
              'PORTFOLIOS',
            )),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Container(
          child: Column(
            children: [
              Image.network(listResponse![index]["MenuIconName"]),
            ],
          ),
        );
      },
      itemCount: listResponse == null? 0: listResponse!.length,
       ),

      // body: Center(
      //   child: Container(
      //     decoration: BoxDecoration(color: Colors.white),
      //     child: Container(
      //       child: dataResponse == null
      //           ? Container()
      //           : Text(dataResponse['Data'].toString()),
      //     ),
      //   ),
      // ),
    );
  }
}