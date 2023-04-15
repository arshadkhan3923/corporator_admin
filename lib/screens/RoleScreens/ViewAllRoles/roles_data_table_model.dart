class AllRoleModel {
  AllRoleModel({
    required this.status,
    required this.data,
  });
  late final String status;
  late final List<Data> data;

  AllRoleModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
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
  });
  late final int id;
  late final String? ownerId;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final String? decrypt;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    ownerId = null;
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    decrypt = null;
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