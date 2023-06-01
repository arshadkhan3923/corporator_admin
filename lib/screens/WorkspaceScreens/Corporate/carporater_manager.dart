import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'carporater_model.dart';
import 'carporater_services.dart';

class CorporateManager with MyValidation {
  late CorporateServices corporateServices = CorporateServices();
  ApiService? apiService;

  CorporateManager({this.apiService});
  final BehaviorSubject<List<CorporateModel>> _main =
      BehaviorSubject<List<CorporateModel>>();

  Stream<List<CorporateModel>> get mainList async* {
    CorporateServices corporateServices = CorporateServices();
    yield await corporateServices.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
