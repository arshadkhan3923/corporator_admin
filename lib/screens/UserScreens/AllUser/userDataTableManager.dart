import 'package:corporator_admin/screens/UserScreens/AllUser/user_data_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'user_data_table_model.dart';


class UserDataTableManager with MyValidation {
  late UserDataTableService userDataTableService = UserDataTableService();
  ApiService? apiService;

  ///Name
  final _name = BehaviorSubject < String >();
  Stream<String> get name$ => _name.stream.transform(updateUserNameLength);
  Sink<String> get inName => _name.sink;

  ///Email
  final _email = BehaviorSubject < String >();
  Stream<String> get email$ => _email.stream.transform(updateUserEmailLength);
  Sink<String> get inEmail => _email.sink;

  /// joining Date
  final _joiningDate = BehaviorSubject < String >();
  Stream<String> get joiningDate$ => _joiningDate.stream.transform(updateUserJoiningLength);
  Sink<String> get inJoiningDate => _joiningDate.sink;

  UserDataTableManager({this.apiService});
  final BehaviorSubject<List<UserModel>> _main =
  BehaviorSubject<List<UserModel>>();

  Stream<List<UserModel>> get mainList async* {
    UserDataTableService userDataTableService =
    UserDataTableService();
    yield await userDataTableService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}