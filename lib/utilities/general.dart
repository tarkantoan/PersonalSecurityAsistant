import 'package:shared_preferences/shared_preferences.dart';

import '../classes/user.class.dart';

class General {
  static SharedPreferences? prefs;
  static cUser? _user;
  static cUser? get getUser => _user;
  static setUser(user) => _user = user;
}
