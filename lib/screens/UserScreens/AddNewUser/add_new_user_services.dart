import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../../AppLayers/Networking/network_client.dart';
import '../../../../AppLayers/Streaming/Overseer.dart';

class AddNewUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  Future<bool> addNewFormUserSubmit(
      final userAddress,
      final userPhoneNumber,
      final userZipCode,
      final userPurpose,
      final owenId,
      ) async {
    final response = await apiService.postNewAppUserData(
        {
          'picture':"assets/images/profile.png",
          'address': userAddress.toString(),
          'phone_no': userPhoneNumber.toString(),
          'zip_code': userZipCode.toString(),
          'purpose': userPurpose.toString(),
          'owner_id': owenId.toString(),
        }
    );
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (kDebugMode) {
        print("===========User add ===========");
      }
      if (kDebugMode) {
        print(map.toString());
      }
      if (kDebugMode) {
        print("===========User add ===========");
      }

      return true;
    } else {
      return false;
    }
  }
}

