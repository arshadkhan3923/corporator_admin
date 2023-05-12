class AllActivitiesModel {
  List<Data>? data;
  String? message;

  AllActivitiesModel({this.data, this.message});

  AllActivitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? fileId;
  String? activity;
  String? count;
  String? createdAt;
  String? updatedAt;
  String? userName;
  File? file;

  Data(
      {this.id,
        this.userId,
        this.fileId,
        this.activity,
        this.count,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.file});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fileId = json['file_id'];
    activity = json['activity'];
    count = json['count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['userName'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['file_id'] = this.fileId;
    data['activity'] = this.activity;
    data['count'] = this.count;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['userName'] = this.userName;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class File {
  String? fileName;
  String? id;

  File({this.fileName, this.id});

  File.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['id'] = this.id;
    return data;
  }
}
