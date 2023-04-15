import 'dart:convert';
import 'package:get/get.dart';
import '../../AppLayers/Networking/apis_services.dart';
import '../../AppLayers/Networking/network_client.dart';
import 'all_activities_model.dart';

class AllActivitiesService {
  late ApiService apiService =
  ApiService(networkClient: Get.put(NetworkClient()));
  List<AllActivitiesModel> list = [];
  Future<List<AllActivitiesModel>> browse() async {
      print("this is service ");
    final response = await apiService.getAllActivitiesData();
      print("this is service ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
        print("this is service ");
        print("APi Response");
      list.add(AllActivitiesModel.fromJson(map));
      /// print Response Api
        print(response.toString());
    } else {}
    return list;
  }
}