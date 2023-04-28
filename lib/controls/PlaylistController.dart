import 'package:micmusic/models/PlaylistModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PlaylistController extends ControllerMVC {
  factory PlaylistController() {
    if (_this == null) _this = PlaylistController._();
    return _this;
  }

  static PlaylistController _this =PlaylistController._();
  PlaylistController._();

  List<PlaylistForm> get playlistList => PlaylistModel.playlistList;
}
