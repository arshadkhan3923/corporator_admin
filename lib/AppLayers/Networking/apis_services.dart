import 'package:dio/dio.dart';
import '../Streaming/Overseer.dart';
import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;
  ApiService({required this.networkClient});
  ///LogIn
  Future<Response> loginUser(Map<String, Object> params) {
    return networkClient.post('api/login', params);
  }
  /// Forget Password
  Future<Response> forgetPassword(Map<String, Object> params) {
    return networkClient.post('api/sendcode', params);
  }
  /// verify Forget Password
  Future<Response> verifyForgetPassword(Map<String, Object> params) {
    return networkClient.post('api/verifyPassword', params);
  }
  /// rest Password
  Future<Response> resetPassword(Map<String, Object> params) {
    return networkClient.post('api/resetPassword', params);
  }
  ///get user view
  Future<Response> getUserDataTable() {
    return networkClient.get('api/getalluser',{});
  }
  ///post new App User
  Future<Response> postNewAppUserData(Map<String, Object> params) {
    return networkClient.post('api/userinfo', params);
  }
  /// Update User
  Future<Response> postUpdateUserData(Map<String, Object> params) {
    return networkClient.post('api/update/${Overseer.updateUserId}', params);
  }
  ///get Vendor view
  Future<Response> getVendorDataTable() {
    return networkClient.get('api/admin/users/vendor', {});
  }
  // ${Overseer.updateThemeId}
  ///Get All Role
  Future<Response> getAllRoleData() {
    return networkClient.get('api/admin/allusers',{});
  }
  ///get Download view
  Future<Response> getDownloadData() {
    return networkClient.get('api/activity/download',{});
  }
  ///get Upload view
  Future<Response> getUploadData() {
    return networkClient.get('api/activity/upload',{});
  }
  ///get  All Activities
  Future<Response> getAllActivitiesData() {
    return networkClient.get('api/activity',{});
  }
  ///get  All Specific user
  Future<Response> getAllSpecificData() {
    return networkClient.get('api/activity/user/${Overseer.spacUsDowActId}',{});
  }
  ///get  All Revenue user
  Future<Response> getAllRevenueData() {
    return networkClient.get('api/admin/dashboard',{});
  }
  ///get  All Specific user
  Future<Response> getAllUserPackageData() {
    return networkClient.get('api/admin/userpacakges',{});
  }
  ///get Memory quota view
  Future<Response> getMemoryQuotaData() {
    return networkClient.get('api/admin/AllPackagesList', {});
  }
  /// post add new New workspace
  Future<Response> postCreateNewWorkSpace(Map<String, Object> params) {
    return networkClient.post('api/admin/workspace/', params);
  }
  ///get corporate api
  Future<Response> getCorporateData() {
    return networkClient.get('api/admin/users/corporate', {});
  }
  ///get  all Work Space
  Future<Response> getWorkSpaceData() {
    return networkClient.get('api/admin/workspace/', {});
  }
}