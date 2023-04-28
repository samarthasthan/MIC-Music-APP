import 'package:mic_music_app/models/homepageModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePageController extends ControllerMVC {
  factory HomePageController() {
    if (_this == null) _this = HomePageController._();
    return _this;
  }
  static HomePageController _this = HomePageController._();
  HomePageController._();

  int get numberOfNewAlumbs => HomePageModel.numberOfNewAlumbs;
  int get numberOfRecentMusic => HomePageModel.numberOfRecentMusic;
  List<String> get imageUrl => HomePageModel.imageUrl;
  String get imageUrlWeekly => HomePageModel.imageUrlWeekly;
  List<Map<String, String>> get weekly => HomePageModel.weekly;
  
  List<Map<String, String>> get recentMusic => HomePageModel.recentMusic;
}
