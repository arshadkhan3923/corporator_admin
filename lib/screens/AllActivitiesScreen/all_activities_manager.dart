import 'package:rxdart/rxdart.dart';
import '../../AppLayers/Networking/apis_services.dart';
import '../Auth/My_validation.dart';
import 'all_activities_model.dart';
import 'all_activities_services.dart';

class AllActivityManager with MyValidation {
  late AllActivitiesService allActivitiesService = AllActivitiesService();
  ApiService? apiService;

  AllActivityManager({this.apiService});
  final BehaviorSubject<List<AllActivitiesModel>> _main =
  BehaviorSubject<List<AllActivitiesModel>>();

  Stream<List<AllActivitiesModel>> get mainList async* {
    AllActivitiesService allActivitiesService =
    AllActivitiesService();
    yield await allActivitiesService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}