import 'package:mic_music_app/models/homepageModel.dart';
import 'package:mic_music_app/views/searchHome.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mic_music_app/models/searchHomeModel.dart';

class SearchHomeController extends ControllerMVC {
  factory SearchHomeController() {
    if (_this == null) _this = SearchHomeController._();
    return _this;
  }
  static SearchHomeController _this = SearchHomeController._();
  SearchHomeController._();
  List<String> get historyButton => searchHomeModel.historyButton;

  List<String> get topButton => searchHomeModel.topButton;

  List<Map<String, String>> get searchList => searchHomeModel.searchList;
  List<Map<String, String>> get allTopList => searchHomeModel.allTopList;
  List<Map<String, String>> get searchArtist => searchHomeModel.SearchArtist;
}
