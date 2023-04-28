import 'package:micmusic/models/EditModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class EditController extends ControllerMVC {
  factory EditController() {
    if (_this == null) _this = EditController._();
    return _this;
  }
  static EditController _this = EditController._();
  EditController._();

  String get name => EditModel.name;
  String get email => EditModel.email;
  String get phonenumber => EditModel.phoneNumber;
  String get imagePath => EditModel.imagePath;
  String get gender => EditModel.gender;
  DateTime get dob => EditModel.dob;
}
