import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import 'add_new_WorkSpace_model.dart';

class AddNewWorkSpaceService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<AddNewWorkSpaceModel> list = [];
  Future<bool> createWorkSpaceFormSubmit(
    final name,
    final quota,
    final price,
    final duration,
    final ownerId,
  ) async {
    final response = await apiService.postCreateNewWorkSpace({
      'name': name.toString(),
      'quota': quota.toString(),
      'price': price.toString(),
      'duration': duration.toString(),
      'owner_id': ownerId.toString()
    });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (kDebugMode) {
        print("===========WorkSpace Package Api===========");
      }
      list.add(AddNewWorkSpaceModel.fromJson(map));
      String? message = list[0].message.toString();
      if (kDebugMode) {
        print(list[0].toString());
      }
      if (kDebugMode) {
        print("==================WorkSpace=================");
      }
      Get.snackbar(
        "Congratulation",
        colorText: Overseer.whiteColors,
        backgroundColor: Colors.orangeAccent,
        message,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } else {
      return false;
    }
  }
}
