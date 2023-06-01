class AddNewWorkSpaceModel {
  Data? data;
  String? message;

  AddNewWorkSpaceModel({this.data, this.message});

  AddNewWorkSpaceModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? name;
  String? quota;
  String? duration;
  String? price;
  String? ownerId;
  String? icon;
  String? id;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.name,
      this.quota,
      this.duration,
      this.price,
      this.ownerId,
      this.icon,
      this.id,
      this.updatedAt,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quota = json['quota'];
    duration = json['duration'];
    price = json['price'];
    ownerId = json['owner_id'];
    icon = json['icon'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quota'] = this.quota;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['owner_id'] = this.ownerId;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
