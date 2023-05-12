import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'memory_quota_Model.dart';

class ViewMemoryQuotaService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<MemoryQuotaModel> list = [];
  Future<List<MemoryQuotaModel>> browse() async {
    if (kDebugMode) {
      print("=========this is service=======");
    }
    final response = await apiService.getMemoryQuotaData();
    if (kDebugMode) {
      print("======this is service =====");
    }
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("this is service ");
      }
      if (kDebugMode) {
        print("APi Response");
      }
      list.add(MemoryQuotaModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return list;
  }
}