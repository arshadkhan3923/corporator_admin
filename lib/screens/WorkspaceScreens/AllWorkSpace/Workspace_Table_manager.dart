import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'Workspace_Table_model.dart';
import 'Workspace_Table_services.dart';

class WorkSpaceManager with MyValidation {
  late WorkSpaceService workSpaceService = WorkSpaceService();
  ApiService? apiService;

  WorkSpaceManager({this.apiService});
  final BehaviorSubject<List<WorkSpaceModel>> _main =
      BehaviorSubject<List<WorkSpaceModel>>();

  Stream<List<WorkSpaceModel>> get mainList async* {
    WorkSpaceService workSpaceService = WorkSpaceService();
    yield await workSpaceService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}