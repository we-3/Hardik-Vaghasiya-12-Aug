class UserModel {
  int? liveVersion;
  int? minRequiredVersion;
  bool? isUpdateRequired;
  Null? alert;
  Null? errorCode;
  Null? errorMessage;
  bool? userIsActive;
  bool? status;
  List<Data>? data;
  bool? isDeleted;

  UserModel(
      {this.liveVersion,
      this.minRequiredVersion,
      this.isUpdateRequired,
      this.alert,
      this.errorCode,
      this.errorMessage,
      this.userIsActive,
      this.status,
      this.data,
      this.isDeleted});

  UserModel.fromJson(Map<String, dynamic> json) {
    liveVersion = json['liveVersion'];
    minRequiredVersion = json['minRequiredVersion'];
    isUpdateRequired = json['isUpdateRequired'];
    alert = json['alert'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    userIsActive = json['userIsActive'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['liveVersion'] = this.liveVersion;
    data['minRequiredVersion'] = this.minRequiredVersion;
    data['isUpdateRequired'] = this.isUpdateRequired;
    data['alert'] = this.alert;
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    data['userIsActive'] = this.userIsActive;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class Data {
  String? announcementCategoryName;
  int? announcementCategoryId;
  int? announcementId;
  String? announcementText;
  String? lastUpdatedOn;
  String? sentOn;
  Null? url;
  Null? urlType;
  bool? isDeleted;
  List<Media>? media;

  Data(
      {this.announcementCategoryName,
      this.announcementCategoryId,
      this.announcementId,
      this.announcementText,
      this.lastUpdatedOn,
      this.sentOn,
      this.url,
      this.urlType,
      this.isDeleted,
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    announcementCategoryName = json['announcementCategoryName'];
    announcementCategoryId = json['announcementCategoryId'];
    announcementId = json['announcementId'];
    announcementText = json['announcementText'];
    lastUpdatedOn = json['lastUpdatedOn'];
    sentOn = json['sentOn'];
    url = json['url'];
    urlType = json['urlType'];
    isDeleted = json['isDeleted'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['announcementCategoryName'] = this.announcementCategoryName;
    data['announcementCategoryId'] = this.announcementCategoryId;
    data['announcementId'] = this.announcementId;
    data['announcementText'] = this.announcementText;
    data['lastUpdatedOn'] = this.lastUpdatedOn;
    data['sentOn'] = this.sentOn;
    data['url'] = this.url;
    data['urlType'] = this.urlType;
    data['isDeleted'] = this.isDeleted;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? announcementMediaId;
  String? extension;
  String? fileURL;
  String? fileName;
  bool? isPrevent;
  bool? isDeleted;

  Media(
      {this.announcementMediaId,
      this.extension,
      this.fileURL,
      this.fileName,
      this.isPrevent,
      this.isDeleted});

  Media.fromJson(Map<String, dynamic> json) {
    announcementMediaId = json['announcementMediaId'];
    extension = json['extension'];
    fileURL = json['fileURL'];
    fileName = json['fileName'];
    isPrevent = json['isPrevent'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['announcementMediaId'] = this.announcementMediaId;
    data['extension'] = this.extension;
    data['fileURL'] = this.fileURL;
    data['fileName'] = this.fileName;
    data['isPrevent'] = this.isPrevent;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
