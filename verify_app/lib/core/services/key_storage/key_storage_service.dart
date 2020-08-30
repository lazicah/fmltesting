abstract class KeyStorageService {
  bool hasNotificationsEnabled;

  bool isFirstTime;

  String token;

  bool isDarkMOde;

  bool isLoggedIn;

  String name;

  String email;

  String id;

  String profileImageUrl;

  Future<void> clear();
}
