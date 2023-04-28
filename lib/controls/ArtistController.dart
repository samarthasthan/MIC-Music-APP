import 'package:micmusic/models/ArtistModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ArtistController extends ControllerMVC {
  factory ArtistController() {
    if (_this == null) _this = ArtistController._();
    return _this;
  }

  static ArtistController _this = ArtistController._();
  ArtistController._();

  List<ArtistForm> get artistList => ArtistModel.artistList;
}
