import 'dart:convert';
import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/roles_data_table_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';

class ViewRoleService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<AllRoleModel> list = [];
  Future<List<AllRoleModel>> browse() async {
    if (kDebugMode) {
      print("this is service ");
    }
    final response = await apiService.getAllRoleData();
    if (kDebugMode) {
      print("this is service${response}");
    }
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("this is service ");
      }
      if (kDebugMode) {
        print("APi Response");
      }
      list.add(AllRoleModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return list;
  }
}