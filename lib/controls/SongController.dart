import 'package:micmusic/models/SongModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SongController extends ControllerMVC {
  factory SongController() {
    if (_this == null) _this = SongController._();
    return _this;
  }

  static SongController _this = SongController._();
  SongController._();

  List<SongForm> get songList => SongModel.songList;
}
