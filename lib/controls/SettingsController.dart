import 'package:micmusic/models/SettingsModel.dart';
import "package:mvc_pattern/mvc_pattern.dart";

class SettingsController extends ControllerMVC {
  factory SettingsController() {
    if (_this == null) _this = SettingsController._();
    return _this;
  }

  static SettingsController _this = SettingsController._();
  SettingsController._();

  bool get isNotificationsAllowed => SettingsModel.isNotificationsAllowed;
  String get displayLanguage => SettingsModel.displayLanguage;
  double get version => SettingsModel.version;
}
