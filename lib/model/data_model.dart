// // To parse this JSON data, do
// //
// //     final appMenus = appMenusFromJson(jsonString);

// import 'dart:convert';

// AppMenus appMenusFromJson(String str) => AppMenus.fromJson(json.decode(str));

// String appMenusToJson(AppMenus data) => json.encode(data.toJson());

// class AppMenus {
//     AppMenus({
//         required this.appMenus,
//     });

//     AppMenusClass appMenus;

//     factory AppMenus.fromJson(Map<String, dynamic> json) => AppMenus(
//         appMenus: AppMenusClass.fromJson(json["AppMenus"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "AppMenus": appMenus.toJson(),
//     };
// }

// class AppMenusClass {
//     AppMenusClass({
//         required this.lastUpdateOn,
//         required this.menuIconUrl,
//         required this.data,
//     });

//     String lastUpdateOn;
//     String menuIconUrl;
//     List<Datum> data;

//     factory AppMenusClass.fromJson(Map<String, dynamic> json) => AppMenusClass(
//         lastUpdateOn: json["LastUpdateOn"],
//         menuIconUrl: json["MenuIconUrl"],
//         data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "LastUpdateOn": lastUpdateOn,
//         "MenuIconUrl": menuIconUrl,
//         "Data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//         required this.menuName,
//         required this.menuUrlPath,
//         required this.menuIconName,
//         required this.employee,
//         required this.student,
//         required this.iOs,
//         required this.android,
//     });

//     String id;
//     String menuName;
//     String menuUrlPath;
//     String menuIconName;
//     String employee;
//     String student;
//     String iOs;
//     Android android;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["ID"],
//         menuName: json["MenuName"],
//         menuUrlPath: json["MenuUrlPath"],
//         menuIconName: json["MenuIconName"],
//         employee: json["Employee"],
//         student: json["Student"],
//         iOs: json["iOS"],
//         android: json["Android"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "ID": id,
//         "MenuName": menuName,
//         "MenuUrlPath": menuUrlPath,
//         "MenuIconName": menuIconName,
//         "Employee": employee,
//         "Student": student,
//         "iOS": iOs,
//         "Android": androidValues.reverse[android],
//     };
// }

// enum Android { TRUE }

// final androidValues = EnumValues({
//     "True": Android.TRUE
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
