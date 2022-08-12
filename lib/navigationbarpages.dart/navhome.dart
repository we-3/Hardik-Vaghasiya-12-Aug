// ignore_for_file: unused_local_variable, dead_code

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rbkei/model/announcmodel.dart';
import '../model/AppMenus.dart';
import '../model/announcmodel.dart';

class navhome extends StatefulWidget {
  navhome({Key? key}) : super(key: key);

  @override
  State<navhome> createState() => _navhomeState();
}

class _navhomeState extends State<navhome> {
  List<Data> userList = [];

  Future<List<Data>> getUserApi() async {
    final response = await http.get(Uri.parse(
        'https://mtestsd.rbkei.in/api/StudentAnnouncements?LastUpdatedOn=2000-01-01&AppVersion=106&CategoryHash&SearchTerm'));
    var Data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in Data) {
        print(i['announcementCategoryName']);
        userList.add(Data.fromJson(Data));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<Data>> snapshot) {
                if (snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(snapshot
                                      .data![index].announcementCategoryId
                                      .toString()),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
