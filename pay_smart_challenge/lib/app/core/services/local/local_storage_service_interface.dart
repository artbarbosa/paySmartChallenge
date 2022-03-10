abstract class ILocalStorageService {
  Future setString<T>(String key, String value);
  Future<String?> getString<T>(String key);
  Future<bool> remove(String key);
}
