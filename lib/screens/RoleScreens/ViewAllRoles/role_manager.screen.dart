import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/role_services_screen.dart';
import 'package:corporator_admin/screens/RoleScreens/ViewAllRoles/roles_data_table_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';

class ViewRoleManager with MyValidation {
  late ViewRoleService viewRoleService = ViewRoleService();
  ApiService? apiService;

  ViewRoleManager({this.apiService});
  final BehaviorSubject<List<AllRoleModel>> _main =
  BehaviorSubject<List<AllRoleModel>>();

  Stream<List<AllRoleModel>> get mainList async* {
    ViewRoleService viewRoleService =
    ViewRoleService();
    yield await viewRoleService.browse();
  }
  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}