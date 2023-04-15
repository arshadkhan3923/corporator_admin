import 'dart:convert';
import 'package:corporator_admin/screens/UserScreens/UserOverviewScreen/UserActivityScreen/specific_user_model.dart';
import 'package:get/get.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../../AppLayers/Networking/network_client.dart';

class SpecificUserService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<SpecificUserModel> list = [];
  Future<List<SpecificUserModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getAllSpecificData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");
      print("APi Response");
      list.add(SpecificUserModel.fromJson(map));
      /// print Response Api
      print(response.toString());
    } else {}
    return list;
  }
}