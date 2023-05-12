import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'memory_quota_Model.dart';
import 'memory_quota_services.dart';

class AllMemoryQuotaManager with MyValidation {
  late ViewMemoryQuotaService viewMemoryQuotaService = ViewMemoryQuotaService();
  ApiService? apiService;

  AllMemoryQuotaManager({this.apiService});
  final BehaviorSubject<List<MemoryQuotaModel>> _main =
  BehaviorSubject<List<MemoryQuotaModel>>();

  Stream<List<MemoryQuotaModel>> get mainList async* {
    ViewMemoryQuotaService viewMemoryQuotaService =
    ViewMemoryQuotaService();
    yield await viewMemoryQuotaService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}