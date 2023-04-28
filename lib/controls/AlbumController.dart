import 'package:micmusic/models/AlbumModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AlbumController extends ControllerMVC {
  factory AlbumController() {
    if (_this == null) _this = AlbumController._();
    return _this;
  }

  static AlbumController _this = AlbumController._();
  AlbumController._();

  List<AlbumForm> get albumList => AlbumModel.albumList;
}
