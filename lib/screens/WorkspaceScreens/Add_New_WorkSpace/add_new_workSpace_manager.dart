import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'add_new_workSpace_services.dart';

class AddWorkSpaceNewManager with MyValidation {
  late AddNewWorkSpaceService addNewWorkSpaceService = AddNewWorkSpaceService();
  ApiService? apiService;
  AddWorkSpaceNewManager({this.apiService});

  ///  name
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _name.stream.transform(workSpaceLength);
  Sink<String> get inName => _name.sink;

  ///  Quota
  final _quota = BehaviorSubject<String>();
  Stream<String> get quota$ => _quota.stream.transform(workSpaceLength);
  Sink<String> get inqQuota => _quota.sink;

  ///  price
  final _price = BehaviorSubject<String>();
  Stream<String> get price$ => _price.stream.transform(workSpaceLength);
  Sink<String> get inPrice => _price.sink;

  ///  duration
  final _duration = BehaviorSubject<String>();
  Stream<String> get duration$ => _duration.stream.transform(workSpaceLength);
  Sink<String> get inDuration => _duration.sink;

  /// owner id
  final _ownerId = BehaviorSubject<String>();
  Stream<String> get ownerId$ => _ownerId.stream.transform(workSpaceLength);
  Sink<String> get inOwnerId => _ownerId.sink;

  ///Object
  Stream<bool> get isFormRegisterVendorValid$ => CombineLatestStream([
        name$,
        quota$,
        price$,
        duration$,
        ownerId$,
      ], (values) => true);

  ///is User Form Submit
  Stream<bool> get isFormRegisterVendorSubmit$ async* {
    yield await addNewWorkSpaceService.createWorkSpaceFormSubmit(
        _name.value,
        _quota.value,
        _price.value,
        _duration.value,
        _ownerId.value,
    );
  }
}
