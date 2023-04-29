import 'package:micmusic/models/RadioModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RadioController extends ControllerMVC {
  factory RadioController() {
    if (_this == null) _this = RadioController._();
    return _this;
  }

  static RadioController _this = RadioController._();
  RadioController._();

  List<RadioImageForm> get radioImageList => RadioModel.radioImageList;
}
