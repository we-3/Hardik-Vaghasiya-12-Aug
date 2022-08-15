// To parse this JSON data, do
//
//     final updateNotificationModel = updateNotificationModelFromJson(jsonString);

import 'dart:convert';

UpdateNotificationModel updateNotificationModelFromJson(String str) => UpdateNotificationModel.fromJson(json.decode(str));

String updateNotificationModelToJson(UpdateNotificationModel data) => json.encode(data.toJson());

class UpdateNotificationModel {
  UpdateNotificationModel({
    this.liveVersion,
    this.minRequiredVersion,
    this.isUpdateRequired,
    this.alert,
    this.errorCode,
    this.errorMessage,
    this.userIsActive,
    this.status,
    this.data,
    this.isDeleted,
  });

  int? liveVersion;
  int? minRequiredVersion;
  bool? isUpdateRequired;
  dynamic alert;
  dynamic errorCode;
  dynamic errorMessage;
  bool? userIsActive;
  bool? status;
  List<UpdateData>? data;
  bool? isDeleted;

  factory UpdateNotificationModel.fromJson(Map<String, dynamic> json) => UpdateNotificationModel(
    liveVersion: json["liveVersion"] == null ? null : json["liveVersion"],
    minRequiredVersion: json["minRequiredVersion"] == null ? null : json["minRequiredVersion"],
    isUpdateRequired: json["isUpdateRequired"] == null ? null : json["isUpdateRequired"],
    alert: json["alert"],
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    userIsActive: json["userIsActive"] == null ? null : json["userIsActive"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<UpdateData>.from(json["data"].map((x) => UpdateData.fromJson(x))),
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "liveVersion": liveVersion == null ? null : liveVersion,
    "minRequiredVersion": minRequiredVersion == null ? null : minRequiredVersion,
    "isUpdateRequired": isUpdateRequired == null ? null : isUpdateRequired,
    "alert": alert,
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "userIsActive": userIsActive == null ? null : userIsActive,
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "isDeleted": isDeleted == null ? null : isDeleted,
  };
}

class UpdateData {
  UpdateData({
    this.announcementCategoryName,
    this.announcementCategoryId,
    this.announcementId,
    this.announcementText,
    this.lastUpdatedOn,
    this.sentOn,
    this.url,
    this.urlType,
    this.isDeleted,
    this.multimediafiles,
    this.documentfiles,
  });

  String? announcementCategoryName;
  int? announcementCategoryId;
  int? announcementId;
  String? announcementText;
  DateTime? lastUpdatedOn;
  DateTime? sentOn;
  dynamic url;
  dynamic urlType;
  bool? isDeleted;
  List<dynamic>? multimediafiles;
  List<Documentfile>? documentfiles;

  factory UpdateData.fromJson(Map<String, dynamic> json) => UpdateData(
    announcementCategoryName: json["announcementCategoryName"] == null ? null : json["announcementCategoryName"],
    announcementCategoryId: json["announcementCategoryId"] == null ? null : json["announcementCategoryId"],
    announcementId: json["announcementId"] == null ? null : json["announcementId"],
    announcementText: json["announcementText"] == null ? null : json["announcementText"],
    lastUpdatedOn: json["lastUpdatedOn"] == null ? null : DateTime.parse(json["lastUpdatedOn"]),
    sentOn: json["sentOn"] == null ? null : DateTime.parse(json["sentOn"]),
    url: json["url"],
    urlType: json["urlType"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    multimediafiles: json["multimediafiles"] == null ? null : List<dynamic>.from(json["multimediafiles"].map((x) => x)),
    documentfiles: json["documentfiles"] == null ? null : List<Documentfile>.from(json["documentfiles"].map((x) => Documentfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "announcementCategoryName": announcementCategoryName == null ? null : announcementCategoryName,
    "announcementCategoryId": announcementCategoryId == null ? null : announcementCategoryId,
    "announcementId": announcementId == null ? null : announcementId,
    "announcementText": announcementText == null ? null : announcementText,
    "lastUpdatedOn": lastUpdatedOn == null ? null : lastUpdatedOn!.toIso8601String(),
    "sentOn": sentOn == null ? null : sentOn!.toIso8601String(),
    "url": url,
    "urlType": urlType,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "multimediafiles": multimediafiles == null ? null : List<dynamic>.from(multimediafiles!.map((x) => x)),
    "documentfiles": documentfiles == null ? null : List<dynamic>.from(documentfiles!.map((x) => x.toJson())),
  };
}

class Documentfile {
  Documentfile({
    this.announcementMediaId,
    this.extension,
    this.fileUrl,
    this.fileName,
    this.isPrevent,
    this.isDeleted,
  });

  int? announcementMediaId;
  String? extension;
  String? fileUrl;
  String? fileName;
  bool? isPrevent;
  bool? isDeleted;

  factory Documentfile.fromJson(Map<String, dynamic> json) => Documentfile(
    announcementMediaId: json["announcementMediaId"] == null ? null : json["announcementMediaId"],
    extension: json["extension"] == null ? null : json["extension"],
    fileUrl: json["fileURL"] == null ? null : json["fileURL"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    isPrevent: json["isPrevent"] == null ? null : json["isPrevent"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "announcementMediaId": announcementMediaId == null ? null : announcementMediaId,
    "extension": extension == null ? null : extension,
    "fileURL": fileUrl == null ? null : fileUrl,
    "fileName": fileName == null ? null : fileName,
    "isPrevent": isPrevent == null ? null : isPrevent,
    "isDeleted": isDeleted == null ? null : isDeleted,
  };
}
