
import 'dart:convert';

SdAppMenusModel sdAppMenusModelFromJson(String str) => SdAppMenusModel.fromJson(json.decode(str));

String sdAppMenusModelToJson(SdAppMenusModel data) => json.encode(data.toJson());

class SdAppMenusModel {
  SdAppMenusModel({
    this.appMenus,
  });

  AppMenus? appMenus;

  factory SdAppMenusModel.fromJson(Map<String, dynamic> json) => SdAppMenusModel(
    appMenus: json["AppMenus"] == null ? null : AppMenus.fromJson(json["AppMenus"]),
  );

  Map<String, dynamic> toJson() => {
    "AppMenus": appMenus == null ? null : appMenus!.toJson(),
  };
}

class AppMenus {
  AppMenus({
    this.lastUpdateOn,
    this.menuIconUrl,
    this.data,
  });

  String? lastUpdateOn;
  String? menuIconUrl;
  List<AppMenusDataModel>? data;

  factory AppMenus.fromJson(Map<String, dynamic> json) => AppMenus(
    lastUpdateOn: json["LastUpdateOn"] == null ? null : json["LastUpdateOn"],
    menuIconUrl: json["MenuIconUrl"] == null ? null : json["MenuIconUrl"],
    data: json["Data"] == null ? null : List<AppMenusDataModel>.from(json["Data"].map((x) => AppMenusDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "LastUpdateOn": lastUpdateOn == null ? null : lastUpdateOn,
    "MenuIconUrl": menuIconUrl == null ? null : menuIconUrl,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AppMenusDataModel {
  AppMenusDataModel({
    this.id,
    this.menuName,
    this.menuUrlPath,
    this.menuIconName,
    this.employee,
    this.student,
    this.iOs,
    this.android,
  });

  String? id;
  String? menuName;
  String? menuUrlPath;
  String? menuIconName;
  String? employee;
  String? student;
  String? iOs;
  String? android;

  factory AppMenusDataModel.fromJson(Map<String, dynamic> json) => AppMenusDataModel(
    id: json["ID"] == null ? null : json["ID"],
    menuName: json["MenuName"] == null ? null : json["MenuName"],
    menuUrlPath: json["MenuUrlPath"] == null ? null : json["MenuUrlPath"],
    menuIconName: json["MenuIconName"] == null ? null : json["MenuIconName"],
    employee: json["Employee"] == null ? null : json["Employee"],
    student: json["Student"] == null ? null : json["Student"],
    iOs: json["iOS"] == null ? null : json["iOS"],
    android: json["Android"] == null ? null : json["Android"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "MenuName": menuName == null ? null : menuName,
    "MenuUrlPath": menuUrlPath == null ? null : menuUrlPath,
    "MenuIconName": menuIconName == null ? null : menuIconName,
    "Employee": employee == null ? null : employee,
    "Student": student == null ? null : student,
    "iOS": iOs == null ? null : iOs,
    "Android": android == null ? null : android,
  };
}
