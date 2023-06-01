class WorkSpaceModel {
  String? status;
  List<Data>? data;

  WorkSpaceModel({this.status, this.data});

  WorkSpaceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? quota;
  String? ownerId;
  String? price;
  String? icon;
  String? type;
  String? duration;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.name,
      this.quota,
      this.ownerId,
      this.price,
      this.icon,
      this.type,
      this.duration,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quota = json['quota'];
    ownerId = json['owner_id'];
    price = json['price'];
    icon = json['icon'];
    type = json['type'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quota'] = this.quota;
    data['owner_id'] = this.ownerId;
    data['price'] = this.price;
    data['icon'] = this.icon;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? ownerId;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? decrypt;
  String? createdAt;
  String? updatedAt;
  List<Corporateteams>? corporateteams;
  Userinfo? userinfo;

  User(
      {this.id,
      this.ownerId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.decrypt,
      this.createdAt,
      this.updatedAt,
      this.corporateteams,
      this.userinfo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    decrypt = json['decrypt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['corporateteams'] != null) {
      corporateteams = <Corporateteams>[];
      json['corporateteams'].forEach((v) {
        corporateteams!.add(new Corporateteams.fromJson(v));
      });
    }
    userinfo = json['userinfo'] != null
        ?  Userinfo.fromJson(json['userinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['decrypt'] = this.decrypt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.corporateteams != null) {
      data['corporateteams'] =
          this.corporateteams!.map((v) => v.toJson()).toList();
    }
    if (this.userinfo != null) {
      data['userinfo'] = this.userinfo!.toJson();
    }
    return data;
  }
}

class Corporateteams {
  String? ownerId;
  String? totalUsedQuota;

  Corporateteams({this.ownerId, this.totalUsedQuota});

  Corporateteams.fromJson(Map<String, dynamic> json) {
    ownerId = json['owner_id'];
    totalUsedQuota = json['totalUsedQuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['owner_id'] = this.ownerId;
    data['totalUsedQuota'] = this.totalUsedQuota;
    return data;
  }
}

class Userinfo {
  String? id;
  String? address;
  String? picture;
  String? phoneNo;
  String? zipCode;
  String? purpose;
  String? totalFileSize;
  String? userId;
  String? ownerId;
  String? packageId;
  String? pkgExpiry;
  Null? company;
  String? createdAt;
  String? updatedAt;

  Userinfo(
      {this.id,
      this.address,
      this.picture,
      this.phoneNo,
      this.zipCode,
      this.purpose,
      this.totalFileSize,
      this.userId,
      this.ownerId,
      this.packageId,
      this.pkgExpiry,
      this.company,
      this.createdAt,
      this.updatedAt});

  Userinfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    picture = json['picture'];
    phoneNo = json['phone_no'];
    zipCode = json['zip_code'];
    purpose = json['purpose'];
    totalFileSize = json['total_file_size'];
    userId = json['user_id'];
    ownerId = json['owner_id'];
    packageId = json['package_id'];
    pkgExpiry = json['pkg_expiry'];
    company = json['company'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['picture'] = this.picture;
    data['phone_no'] = this.phoneNo;
    data['zip_code'] = this.zipCode;
    data['purpose'] = this.purpose;
    data['total_file_size'] = this.totalFileSize;
    data['user_id'] = this.userId;
    data['owner_id'] = this.ownerId;
    data['package_id'] = this.packageId;
    data['pkg_expiry'] = this.pkgExpiry;
    data['company'] = this.company;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
