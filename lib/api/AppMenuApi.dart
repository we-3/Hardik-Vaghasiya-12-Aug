
// class AppMenu {
//   final AppMenus? appMenus;

//   AppMenu({
//     this.appMenus,
//   });

//   AppMenu copyWith({
//     AppMenus? appMenus,
//   }) {
//     return AppMenu(
//       appMenus: appMenus ?? this.appMenus,
//     );
//   }

//   AppMenu.fromJson(Map<String, dynamic> json)
//     : appMenus = (json['AppMenus'] as Map<String,dynamic>?) != null ? AppMenus.fromJson(json['AppMenus'] as Map<String,dynamic>) : null;

//   Map<String, dynamic> toJson() => {
//     'AppMenus' : appMenus?.toJson()
//   };
// }

// class AppMenus {
//   final String? lastUpdateOn;
//   final String? menuIconUrl;
//   final List<Data>? data;

//   AppMenus({
//     this.lastUpdateOn,
//     this.menuIconUrl,
//     this.data,
//   });

//   AppMenus copyWith({
//     String? lastUpdateOn,
//     String? menuIconUrl,
//     List<Data>? data,
//   }) {
//     return AppMenus(
//       lastUpdateOn: lastUpdateOn ?? this.lastUpdateOn,
//       menuIconUrl: menuIconUrl ?? this.menuIconUrl,
//       data: data ?? this.data,
//     );
//   }

//   AppMenus.fromJson(Map<String, dynamic> json)
//     : lastUpdateOn = json['LastUpdateOn'] as String?,
//       menuIconUrl = json['MenuIconUrl'] as String?,
//       data = (json['Data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

//   Map<String, dynamic> toJson() => {
//     'LastUpdateOn' : lastUpdateOn,
//     'MenuIconUrl' : menuIconUrl,
//     'Data' : data?.map((e) => e.toJson()).toList()
//   };
// }

// class Data {
//   final String? iD;
//   final String? menuName;
//   final String? menuUrlPath;
//   final String? menuIconName;
//   final String? employee;
//   final String? student;
//   final String? iOS;
//   final String? android;

//   Data({
//     this.iD,
//     this.menuName,
//     this.menuUrlPath,
//     this.menuIconName,
//     this.employee,
//     this.student,
//     this.iOS,
//     this.android,
//   });

//   Data copyWith({
//     String? iD,
//     String? menuName,
//     String? menuUrlPath,
//     String? menuIconName,
//     String? employee,
//     String? student,
//     String? iOS,
//     String? android,
//   }) {
//     return Data(
//       iD: iD ?? this.iD,
//       menuName: menuName ?? this.menuName,
//       menuUrlPath: menuUrlPath ?? this.menuUrlPath,
//       menuIconName: menuIconName ?? this.menuIconName,
//       employee: employee ?? this.employee,
//       student: student ?? this.student,
//       iOS: iOS ?? this.iOS,
//       android: android ?? this.android,
//     );
//   }

//   Data.fromJson(Map<String, dynamic> json)
//     : iD = json['ID'] as String?,
//       menuName = json['MenuName'] as String?,
//       menuUrlPath = json['MenuUrlPath'] as String?,
//       menuIconName = json['MenuIconName'] as String?,
//       employee = json['Employee'] as String?,
//       student = json['Student'] as String?,
//       iOS = json['iOS'] as String?,
//       android = json['Android'] as String?;

//   Map<String, dynamic> toJson() => {
//     'ID' : iD,
//     'MenuName' : menuName,
//     'MenuUrlPath' : menuUrlPath,
//     'MenuIconName' : menuIconName,
//     'Employee' : employee,
//     'Student' : student,
//     'iOS' : iOS,
//     'Android' : android
//   };
// }