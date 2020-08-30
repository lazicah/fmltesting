import 'package:verify_app/core/services/key_storage/key_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service that is responsible for storing/retrieving data in/from
/// local storage using the [SharedPreferences] package.
class KeyStorageServiceImpl implements KeyStorageService {
  static const notifications_key = 'notifications_key';
  static const first_time = 'first_time';
  static const _token = 'token';
  static const theme = 'theme';
  static const logged = 'logged';
  static const username = 'name';
  static const useremail = 'email';
  static const userid = 'id';
  static const image = 'image';

  static KeyStorageServiceImpl _instance;
  static SharedPreferences _preferences;

  static Future<KeyStorageServiceImpl> getInstance() async {
    _instance ??= KeyStorageServiceImpl();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance;
  }

  @override
  bool get hasNotificationsEnabled => _getFromDisk(notifications_key) ?? false;
  set hasNotificationsEnabled(bool value) =>
      _saveToDisk(notifications_key, value);

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);

    //Logger.d('LocalStorageService: (Fetching) key: $key value: $value');

    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    //Logger.d('LocalStorageService: (Saving) key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  @override
  bool get isFirstTime => _getFromDisk(first_time) ?? true;

  @override
  set isFirstTime(bool _isFirstTime) {
    _saveToDisk(first_time, _isFirstTime);
  }

  @override
  String get token => _getFromDisk(_token) ?? "";

  @override
  set token(String token) {
    _saveToDisk(_token, token);
  }

  @override
  bool get isDarkMOde => _getFromDisk(theme) ?? false;

  @override
  set isDarkMOde(bool _isDarkMOde) {
    print('dark-mode $_isDarkMOde');
    _saveToDisk(theme, _isDarkMOde);
  }

  @override
  bool get isLoggedIn => _getFromDisk(logged) ?? false;

  @override
  set isLoggedIn(bool _isLoggedIn) {
    print('Login State $_isLoggedIn');
    _saveToDisk(logged, _isLoggedIn);
  }

  @override
  String get email => _getFromDisk(useremail) ?? "";

  @override
  String get id => _getFromDisk(userid) ?? "";

  @override
  String get name => _getFromDisk(username) ?? "";

  @override
  set email(String _email) {
    print('useremail $_email');
    _saveToDisk(useremail, _email);
  }

  @override
  set id(String _id) {
    print('userid $_id');
    _saveToDisk(userid, _id);
  }

  @override
  set name(String _name) {
    print('username $_name');
    _saveToDisk(username, _name);
  }

  @override
  Future<void> clear() async {
    // TODO: implement clear
    await _preferences.clear();
  }

  @override
  String get profileImageUrl => _getFromDisk(image) ?? "";

  @override
   set profileImageUrl(String _profileImageUrl) {
     print('image $_profileImageUrl');
    _saveToDisk(image, _profileImageUrl);
  }
}
