import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_service_interface.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  final Future<SharedPreferences> sharedPreferences;
  SharedPreferencesLocalStorageService({
    required this.sharedPreferences,
  });

  @override
  Future<bool> setString<T>(String key, String value) async {
    final _prefs = await sharedPreferences;
    return _prefs.setString(key, value);
  }

  @override
  Future<String?> getString<T>(String key) async {
    final _prefs = await sharedPreferences;
    return _prefs.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    final shared = await sharedPreferences;
    return shared.remove(key);
  }
}
