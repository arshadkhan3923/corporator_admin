import 'package:corporator_admin/screens/UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_model.dart';
import 'package:corporator_admin/screens/UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_service.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../../Auth/My_validation.dart';

class SpecificUserManager with MyValidation {
  late SpecificUserService specificUserService = SpecificUserService();
  ApiService? apiService;

  SpecificUserManager({this.apiService});
  final BehaviorSubject<List<SpecificUserModel>> _main =
  BehaviorSubject<List<SpecificUserModel>>();

  Stream<List<SpecificUserModel>> get mainList async* {
    SpecificUserService specificUserService =
    SpecificUserService();
    yield await specificUserService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}