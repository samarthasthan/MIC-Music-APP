import 'package:micmusic/models/AccountsModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AccountsController extends ControllerMVC {
  factory AccountsController() {
    if (_this == null) _this = AccountsController._();
    return _this;
  }
  static AccountsController _this = AccountsController._();
  AccountsController._();

  int get numberOfPlayLists => AccountsModel.numberOfPlaylists;
  String get numberOfFollowers => AccountsModel.numberOfFollowers;
  int get numberOfFollowing => AccountsModel.numberOfFollowing;
  List<RecentActivity> get imagePath => AccountsModel.imagePath;
}
