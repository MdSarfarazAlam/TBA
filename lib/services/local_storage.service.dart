import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
