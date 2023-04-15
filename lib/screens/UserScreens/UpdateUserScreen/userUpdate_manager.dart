import 'package:corporator_admin/screens/UserScreens/UpdateUserScreen/update_user_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';

class UpdateUserManager with MyValidation {
  late UpdateUserService updateUserService = UpdateUserService();
  ApiService? apiService;
  UpdateUserManager({this.apiService});

  ///Name
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _name.stream.transform(editUserNameLength);
  Sink<String> get inName => _name.sink;

  ///Price
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(editUserEmailLength);
  Sink<String> get inEmail => _email.sink;

  /// Address
  final _address= BehaviorSubject<String>();
  Stream<String> get address$ => _address.stream.transform(editUserAddressLength);
  Sink<String> get inAddress => _address.sink;

  /// Phone No
  final _phoneNo= BehaviorSubject<String>();
  Stream<String> get phoneNo$ => _phoneNo.stream.transform(editUserPhoneNoLength);
  Sink<String> get inPhoneNo => _phoneNo.sink;

  /// Zip Code
  final _zipCode= BehaviorSubject<String>();
  Stream<String> get zipCode$ => _zipCode.stream.transform(editUserZipCodeLength);
  Sink<String> get inZipCode => _zipCode.sink;

  /// Purpose
  final _purpose= BehaviorSubject<String>();
  Stream<String> get purpose$ => _purpose.stream.transform(editUserPurposeLength);
  Sink<String> get inPurpose => _purpose.sink;

  ///Object
  Stream<bool> get isUserFormValid$ =>
      CombineLatestStream([
      name$,
      email$,
       address$,
       phoneNo$,
       zipCode$,
       purpose$,
      ], (values) => true);
  ///is Login Form Submit
  Stream<bool> get isUserFormSubmit$ async* {
    yield await updateUserService.updateUserSubmitForm(
      _name.value,
      _email.value,
      _address.value,
      _phoneNo.value,
      _zipCode.value,
      _purpose.value,
    );
  }
}