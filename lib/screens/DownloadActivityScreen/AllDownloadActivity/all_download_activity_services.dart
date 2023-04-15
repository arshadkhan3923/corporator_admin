import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import 'download_data_table_model.dart';

class AllDownloadService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<DownloadModel> list = [];
  Future<List<DownloadModel>> browse() async {
    if (kDebugMode) {
      print("this is service ");
    }
    final response = await apiService.getDownloadData();
    if (kDebugMode){
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
      list.add(DownloadModel.fromJson(map));
      /// print Response Api
      if (kDebugMode) {
        print(response.toString());
      }
    } else {}
    return list;
  }
}