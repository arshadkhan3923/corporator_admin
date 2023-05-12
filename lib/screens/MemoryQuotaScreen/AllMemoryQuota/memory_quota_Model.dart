class MemoryQuotaModel {
  MemoryQuotaModel({
    required this.data,
  });
  late final List<Data> data;

  MemoryQuotaModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.quota,
    required this.ownerId,
    required this.price,
    required this.icon,
    required this.type,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
  late final String id;
  late final String name;
  late final String quota;
  late final String ownerId;
  late final String price;
  late final String icon;
  late final String type;
  late final String duration;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final User user;

  Data.fromJson(Map<String, dynamic> json){
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
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['quota'] = quota;
    _data['owner_id'] = ownerId;
    _data['price'] = price;
    _data['icon'] = icon;
    _data['type'] = type;
    _data['duration'] = duration;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    this.ownerId,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.decrypt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String? ownerId;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String decrypt;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    ownerId = null;
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = json['decrypt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return _data;
  }
}