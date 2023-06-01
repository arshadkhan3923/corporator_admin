import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'carporater_model.dart';

class CorporateServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<CorporateModel> list = [];
  Future<List<CorporateModel>> browse() async {
    if (kDebugMode) {
      print("=========this is service=======");
    }
    final response = await apiService.getCorporateData();
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
      list.add(CorporateModel.fromJson(map));

      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return list;
  }
}
