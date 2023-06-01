class CorporateModel {
  List<Data>? data;
  String? status;

  CorporateModel({this.data, this.status});

  CorporateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? ownerId;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? decrypt;
  String? createdAt;
  String? updatedAt;
  Null? company;

  Data(
      {this.id,
      this.ownerId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.decrypt,
      this.createdAt,
      this.updatedAt,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    decrypt = json['decrypt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['decrypt'] = this.decrypt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company'] = this.company;
    return data;
  }
}
