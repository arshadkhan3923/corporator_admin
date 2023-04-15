

import 'package:rxdart/rxdart.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'all_download_activity_services.dart';
import 'download_data_table_model.dart';

class AllDownloadManager with MyValidation {
  late AllDownloadService allDownloadService = AllDownloadService();
  ApiService? apiService;

  AllDownloadManager({this.apiService});
  final BehaviorSubject<List<DownloadModel>> _main =
  BehaviorSubject<List<DownloadModel>>();

  Stream<List<DownloadModel>> get mainList async* {
    AllDownloadService allDownloadService =
    AllDownloadService();
    yield await allDownloadService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}
