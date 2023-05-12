import 'dart:convert';
import 'package:corporator_admin/screens/UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_model.dart';
import 'package:get/get.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../../AppLayers/Networking/network_client.dart';

class SpecificUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<SpecificUserModel> list = [];
  Future<List<SpecificUserModel>> browse() async {
    print("this is service ");
    final response = await apiService.getAllSpecificData();
    print("this is service ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is service ");
      print("APi Response");
      list.add(SpecificUserModel.fromJson(map));
      /// print Response Api
      print(response.toString());
    } else {}
    return list;
  }
}