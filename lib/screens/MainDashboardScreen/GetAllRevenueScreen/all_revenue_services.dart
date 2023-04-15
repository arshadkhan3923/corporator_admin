

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'all_revenue_model.dart';

class AllRevenueService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<AllRevenueModel> list = [];
  Future<List<AllRevenueModel>> browse() async {
    if (kDebugMode) {
      print("this is service");
    }
    final response = await apiService.getAllRevenueData();
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
      list.add(AllRevenueModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return list;
  }
}