class UserModel {
  UserModel({
   this.i,
   this.data,
});
late final String? i;
late final List<Data>? data;

UserModel.fromJson(Map<String, dynamic> json){
i = json['0'];
data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['0'] = 0;
  _data['data'] = data!.map((e)=>e.toJson()).toList();
  return _data;
}
}

class Data {
  Data({
    required this.id,
    this.ownerId,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.decrypt,
    required this.createdAt,
    required this.updatedAt,
    this.userinfo,
  });
  late final int id;
  late final String? ownerId;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String? decrypt;
  late final String createdAt;
  late final String updatedAt;
  late final Userinfo? userinfo;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    ownerId = null;
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userinfo = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['owner_id'] = ownerId;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['decrypt'] = decrypt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['userinfo'] = userinfo;
    return _data;
  }
}

class Userinfo {
  Userinfo({
    required this.id,
    required this.address,
    required this.picture,
    required this.phoneNo,
    required this.zipCode,
    required this.purpose,
    this.totalFileSize,
    required this.userId,
    required this.ownerId,
    this.packageId,
    this.pkgExpiry,
    this.company,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String address;
  late final String picture;
  late final String phoneNo;
  late final String zipCode;
  late final String purpose;
  late final String? totalFileSize;
  late final String userId;
  late final String ownerId;
  late final String? packageId;
  late final String? pkgExpiry;
  late final String? company;
  late final String createdAt;
  late final String updatedAt;

  Userinfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    address = json['address'];
    picture = json['picture'];
    phoneNo = json['phone_no'];
    zipCode = json['zip_code'];
    purpose = json['purpose'];
    totalFileSize = null;
    userId = json['user_id'];
    ownerId = json['owner_id'];
    packageId = null;
    pkgExpiry = null;
    company = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['address'] = address;
    _data['picture'] = picture;
    _data['phone_no'] = phoneNo;
    _data['zip_code'] = zipCode;
    _data['purpose'] = purpose;
    _data['total_file_size'] = totalFileSize;
    _data['user_id'] = userId;
    _data['owner_id'] = ownerId;
    _data['package_id'] = packageId;
    _data['pkg_expiry'] = pkgExpiry;
    _data['company'] = company;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}