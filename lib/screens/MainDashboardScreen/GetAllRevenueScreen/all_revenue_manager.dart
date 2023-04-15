

import 'package:rxdart/rxdart.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'all_revenue_model.dart';
import 'all_revenue_services.dart';

class AllRevenueManager with MyValidation {
  late AllRevenueService allRevenueService = AllRevenueService();
  ApiService? apiService;

  AllRevenueManager({this.apiService});
  final BehaviorSubject<List<AllRevenueModel>> _main =
  BehaviorSubject<List<AllRevenueModel>>();

  Stream<List<AllRevenueModel>> get mainList async* {
    AllRevenueService allRevenueService =
    AllRevenueService();
    yield await allRevenueService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}

}