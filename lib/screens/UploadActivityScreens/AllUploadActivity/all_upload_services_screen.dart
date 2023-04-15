import 'dart:convert';
import 'package:corporator_admin/screens/UploadActivityScreens/AllUploadActivity/upload_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';

class AllUploadService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UploadModel> list = [];
  Future<List<UploadModel>> browse() async {
    if (kDebugMode) {
      print("this is service ");
    }
    final response = await apiService.getUploadData();
    if (kDebugMode) {
      print("this is service ");
    }
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("this is service ");
      }
      if (kDebugMode) {
        print("APi Response");
      }
      list.add(UploadModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {
    }
    return list;
  }
}