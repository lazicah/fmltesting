import 'package:verify_app/core/services/key_storage/key_storage_service.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';

class ThemeNotifier extends ChangeNotifier {
  final keystorage = locator<KeyStorageService>();

  bool get isDarkMode => keystorage.isDarkMOde;

  void updateTheme({bool value = false}) {
    print(value);
    keystorage.isDarkMOde = value;
    notifyListeners();
  }
}