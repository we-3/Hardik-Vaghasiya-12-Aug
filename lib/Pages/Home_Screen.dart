import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rbkei/Pages/announcement_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/AppMenusModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  List<AppMenusDataModel> appMenusDataModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  getList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userType = prefs.getString('LoginType');
    getAppMenusApi().then((value) {
      if (value != null) {
        print('add list --> ${userType.toString()}');
        if (userType.toString() == 'Student') {
          setState(() {
            value.appMenus!.data!.forEach((element) {
              if (element.student.toString() == 'true' || element.student.toString() =='True')
                appMenusDataModel.add(element);
            });
          });
        } else {
          setState(() {
            value.appMenus!.data!.forEach((element) {
              if (element.employee.toString() == 'true' || element.employee.toString() == 'True')
                appMenusDataModel.add(element);
            });
          });
        }
      }
    });
  }

  Future<SdAppMenusModel?> getAppMenusApi() async {
    try {
      showLoader();
      Response response;
      response = await dio.get(
        'https://project.rbkei.org/SchoolDesk/SDAppMenus.json',
        options: Options(headers: {
          "Content-Type": 'application/json',
          // 'Authorization':'Bearer ${apiToken.toString()}'
        }),
      );
      if (response.statusCode == 200) {
        SdAppMenusModel sdAppMenusModel =
            SdAppMenusModel.fromJson(response.data);
        hideLoader();
        print('get sdAppMenusModel res ----- > ${response.data}');
        return sdAppMenusModel;
      } else {
        throw Exception(response.data);
      }
    } on DioError catch (e) {
      hideLoader();
      print('Dio E  ' + e.toString());
      // throw handleError(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: appMenusDataModel.toString() == '[]'
            ? Text(
                'Data Not Found',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)),
              )
            : GridView.builder(
                padding: EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: appMenusDataModel.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: (){
                      if(appMenusDataModel[index].menuName.toString()=='Announcement')
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xffF8F8FF),
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 2,
                              child: Image.network(
                                appMenusDataModel[index].menuIconName.toString(),
                                height: 50,
                                width: 50,
                              )),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 05),
                            child: Text(
                              appMenusDataModel[index].menuName.toString(),
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }));
  }
}


showLoader() {
  BotToast.showLoading();
}

hideLoader() {
  BotToast.closeAllLoading();
}

