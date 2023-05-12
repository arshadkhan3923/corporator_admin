import 'dart:convert';
import 'package:corporator_admin/screens/UserScreens/UpdateUserScreen/update_user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../../AppLayers/Networking/network_client.dart';
import '../../../AppLayers/Streaming/Overseer.dart';

class UpdateUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<UpdateUserModel> list = [];
  Future<bool> updateUserSubmitForm(
      final name,
      final email,
      final address,
      final phoneNo,
      final zipCode,
      final purpose,
      ) async {
    final response = await apiService.postUpdateUserData({
          'name': name.toString(),
          'email': email.toString(),
          'address': address.toString(),
          'phone_no': phoneNo.toString(),
          'zip_code': zipCode.toString(),
          'purpose': purpose.toString(),
      });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      list.add(UpdateUserModel.fromJson(map));
      String? message = list[0].data.toString();
        if (kDebugMode) {
          print(list[0].toString());
      }
      if (kDebugMode) {
        print("==================Update User=================");
      }
      Get.snackbar(
        "Congratulation",
        colorText: Overseer.whiteColors,
        backgroundColor: Colors.orangeAccent,
        message,
        icon: const Icon(Icons.error_outline,
        color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } else {
      return false;
    }
  }
}