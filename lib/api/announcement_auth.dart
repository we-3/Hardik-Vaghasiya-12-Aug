import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rbkei/navigationbarpages.dart/navhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnnouncAuth extends StatefulWidget {
  const AnnouncAuth({Key? key}) : super(key: key);

  @override
  State<AnnouncAuth> createState() => _AnnouncAuthState();
}

class AnnouncApi {
  final int announcementText;
  final int announcementHash;
  final int announcementTypeName;
  final int thumbnail;
  final int theamColor;
  final int lastUpdatedOn;
  final int sentBy;
  final int sentOn;
  final int announcementMedias;

  AnnouncApi({
    required this.announcementText,
    required this.announcementHash,
    required this.announcementTypeName,
    required this.thumbnail,
    required this.theamColor,
    required this.lastUpdatedOn,
    required this.sentBy,
    required this.sentOn,
    required this.announcementMedias,
  });
  factory AnnouncApi.fromMap(Map<String, dynamic> json) => AnnouncApi(
      announcementText: json["announcementText"],
      announcementHash: json["announcementHash"],
      announcementTypeName: json["announcementTypeName"],
      thumbnail: json["thumbnail"],
      theamColor: json["theamColor"],
      lastUpdatedOn: json["lastUpdatedOn"],
      sentBy: json["sentBy"],
      sentOn: json["sentOn"],
      announcementMedias: json["announcementMedias"]);
  late List<AnnouncApi> data;
}

class _AnnouncAuthState extends State<AnnouncAuth> {
  var announcementText;
  var announcementHash;
  var announcementTypeName;
  var thumbnail;
  var theamColor;
  var lastUpdatedOn;
  var sentBy;
  var sentOn;
  var announcementMedias;
  void AnnouncApi(
      String announcementText,
      announcementHash,
      announcementTypeName,
      thumbnail,
      theamColor,
      lastUpdatedOn,
      sentBy,
      sentOn,
      announcementMedias,
      String)
       async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.get(
        Uri.parse(
            'https://mtestsd.rbkei.in/api/StudentAnnouncements?LastUpdatedOn=2000-01-01'),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOlsiVXNlciIsIkVtcGxveWVlIiwiVXNlciIsIkVtcGxveWVlIiwiRGV2ZWxvcGVyIiwiQ2FsZW5kYXIiLCJBbm5vdW5jZW1lbnQiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6WyJTb2hhbiBLICIsIlNvaGFuIEsgIl0sImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6WyJhcHBAcmJrZWkub3JnIiwiYXBwQHJia2VpLm9yZyJdLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9tb2JpbGVwaG9uZSI6WyI5ODc2NTQzMjEwIiwiOTg3NjU0MzIxMCJdLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6WyI1IiwiNSJdLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3NlcmlhbG51bWJlciI6WyJzczpmZjpkZDpkMTpoNCIsInNzOmZmOmRkOmQxOmg0Il0sImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvYXV0aGVudGljYXRpb25tZXRob2QiOlsiTG9jYWwiLCJMb2NhbCIsIkxvY2FsIiwiTG9jYWwiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjpbIkVtcGxveWVlIiwiRW1wbG95ZWUiXSwiUHJvZmlsZUltYWdlIjpbIjgzMjAyMjE5MTQyLnBuZyIsIjgzMjAyMjE5MTQyLnBuZyJdLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOlsiNSw1LDQiLCI1LDUsNCJdLCJFbXBsb3llZUlkIjpbIjUiLCI1Il0sImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdXNlcmRhdGEiOlsiRW1wbG95ZWUiLCJFbXBsb3llZSJdLCJVc2VyU2Nob29scyI6WyI0IiwiNCJdLCJleHAiOjE2NTQzMzM4MjYsImlzcyI6IioiLCJhdWQiOlsiKiIsIioiXX0.NK384685EhwEW-vHJn9lhPrFxKSKVIjMo0SJ4iMP-yI'
        });
    print('Response status: ${response.body}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['data']);
      print('Okay Fine');
    } else {
      print('Failed');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ExpansionTile(title: Text('data'),
            children: [
              Text('Test Api')
            ],
            ),
          );
        },
        itemCount: 1,
      ),
    );

    //
  }
}
