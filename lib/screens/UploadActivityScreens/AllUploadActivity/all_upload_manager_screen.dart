import 'package:corporator_admin/screens/UploadActivityScreens/AllUploadActivity/upload_user_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'all_upload_services_screen.dart';

class AllUploadManager with MyValidation {
  late AllUploadService allUploadService = AllUploadService();
  ApiService? apiService;

  AllUploadManager({this.apiService});
  final BehaviorSubject<List<UploadModel>> _main =
  BehaviorSubject<List<UploadModel>>();

  Stream<List<UploadModel>> get mainList async* {
    AllUploadService allUploadService =
    AllUploadService();
    yield await allUploadService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}