class UpdateUserModel {
  UpdateUserModel({
    required this.data,
    required this.accessToken,
    required this.tokenType,
  });
  late final Data data;
  late final String accessToken;
  late final String tokenType;

  UpdateUserModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.decrypt,
    required this.createdAt,
    required this.updatedAt,
    required this.userinfo,
  });
  late final int id;
  late final String ownerId;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String decrypt;
  late final String createdAt;
  late final String updatedAt;
  late final Userinfo userinfo;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    ownerId = json['owner_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = json['decrypt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userinfo = Userinfo.fromJson(json['userinfo']);
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
    _data['userinfo'] = userinfo.toJson();
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
  late final Null totalFileSize;
  late final String userId;
  late final String ownerId;
  late final Null packageId;
  late final Null pkgExpiry;
  late final Null company;
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