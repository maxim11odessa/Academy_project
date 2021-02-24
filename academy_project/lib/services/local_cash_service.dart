import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalCashService {
  Future<void> setString(String key, String value);
  Future<String> getString(String key);
}

class LocalCashServiceImpl implements LocalCashService {
  @override
  Future<String> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getString(key);
    return value;
  }

  @override
  Future<void> setString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }
}
