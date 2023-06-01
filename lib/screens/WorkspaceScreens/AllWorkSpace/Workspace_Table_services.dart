import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'Workspace_Table_model.dart';

class WorkSpaceService {
  late ApiService apiService = ApiService(networkClient: Get.put(NetworkClient()));
  List<WorkSpaceModel> workSpaceList = [];
  Future<List<WorkSpaceModel>> browse() async {
    if (kDebugMode) {
      print("This is service");
    }
    final response = await apiService.getWorkSpaceData();
    if (kDebugMode) {
      print("This is service ");
    }
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("This is service ");
      }
      if (kDebugMode) {
        print("APi Response");
      }
      workSpaceList.add(WorkSpaceModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return workSpaceList;
  }
}