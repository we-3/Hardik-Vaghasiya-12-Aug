import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rbkei/Pages/Home_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/update_notification_model.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  TextEditingController _searchController = TextEditingController();
  UpdateNotificationModel  _updateNotificationModel = UpdateNotificationModel();
  String? _chosenValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUpdate(AppVersion: '106',SearchTerm: '',CategoryHash: '',LastUpdatedOn: '2000-01-01').then((value) {
      if(value != null)
        {
          setState((){

          _updateNotificationModel = value;
          });
          print('_update ${_updateNotificationModel.toJson().toString()}');
        }
    });

  }
  final DateFormat formatter = DateFormat('dd-MM-yyyy hh-mm-ss');

  Future<UpdateNotificationModel?> getUpdate(
      {String? LastUpdatedOn,
        String? AppVersion,
        String? CategoryHash,
        String? SearchTerm}) async {
    final prefs = await SharedPreferences.getInstance();
    final String? apiToken11 = prefs.getString('token');
    try {
      showLoader();
      String? apiToken =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOlsiVXNlciIsIlN0dWRlbnQiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IkRlbW8gU3R1ZGVudCAiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJoZWFkaXRAcmJrZWkub3JnIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbW9iaWxlcGhvbmUiOiI5ODIxMjgzNjU4IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIxMyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvc2VyaWFsbnVtYmVyIjoic3M6ZmY6ZGQ6ZDE6aDQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL2F1dGhlbnRpY2F0aW9ubWV0aG9kIjpbIkxvY2FsIiwiTG9jYWwiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiU3R1ZGVudCIsIlByb2ZpbGVJbWFnZSI6IkIwMDkiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiIxMyw0LDAiLCJTdHVkZW50SWQiOiI0IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy91c2VyZGF0YSI6IlN0dWRlbnQiLCJleHAiOjE2OTA2OTU3MzcsImlzcyI6IioiLCJhdWQiOiIqIn0.p2xDwjnW63Yt0Sc-6GkdWENT3pqWMRKA_zYlY94Yu6U';

      final response = await http.get(
        Uri.parse(
            'https://mtestsd.rbkei.in/api/StudentAnnouncements?LastUpdatedOn=$LastUpdatedOn&AppVersion=$AppVersion&CategoryHash=$CategoryHash&SearchTerm=$SearchTerm'),
        headers: {'Authorization': 'Bearer ${apiToken.toString()}'},
      );
      if (response.statusCode == 200) {
        final databody = json.decode(response.body);

        UpdateNotificationModel updateNotificationModel =
        UpdateNotificationModel.fromJson(databody);
        hideLoader();
        return updateNotificationModel;
      } else {
        hideLoader();
        throw Exception("error --------${response.body}");
      }
    } catch (e) {
      hideLoader();
      print('http E =========++' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 08),
                    child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey.shade500),
                  ),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Message',
                    'Circular',
                    'NewsLetter',
                    'Exam',
                    'Academic'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Category",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(

                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Type here to search...',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  getUpdate(AppVersion: '106',SearchTerm: value ?? '',CategoryHash: '',LastUpdatedOn: '2000-01-01').then((value) {
                    if(value != null)
                    {
                      setState((){

                        _updateNotificationModel = value;
                      });
                      print('_update ${_updateNotificationModel.toJson().toString()}');
                    }
                  });


                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child:_updateNotificationModel.data == null ? SizedBox() :  ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 3),
                shrinkWrap: true,
                itemCount: _updateNotificationModel.data!.length,
                physics: AlwaysScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 15),
                    height: 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.65),
                            Colors.grey.shade500,
                            Colors.white,
                            Colors.white
                          ]),
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [

                  // final DateTime now = DateTime.now();
                  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  // final String formatted = formatter.format(now);
                  // print(formatted);

                          Text(
                          formatter.format(_updateNotificationModel.data![index].lastUpdatedOn!),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            ' ( ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          Icon(
                            Icons.bookmark,
                            color: Colors.black.withOpacity(.25),
                          ),
                          Text(
                            ' ${_updateNotificationModel.data![index].announcementCategoryName} )',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                  Html(
                  data: """${_updateNotificationModel.data![index].announcementText}""",
                    onLinkTap: (url, _, __, ___) async {
                      print('URL IS: $url');
                      if (await canLaunch(url!)) {
                        await launch(url.toString().trim());
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
