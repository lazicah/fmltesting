import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:verify_app/core/services/connectivity/connectivity_service.dart';
import 'package:verify_app/core/services/connectivity/connectivity_service_impl.dart';
import 'package:verify_app/core/services/location/locationservice.dart';
import 'package:verify_app/core/services/location/locationservice_impl.dart';
import 'package:verify_app/core/utils/file_helper.dart';

import 'core/services/Api/ApiService.dart';
import 'core/services/Api/ApiServiceImpl.dart';
import 'core/services/key_storage/key_storage_impl.dart';
import 'core/services/key_storage/key_storage_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({bool test = false}) async {
  // Services
  locator.registerLazySingleton(
    () => NavigationService(),
  );

  locator.registerLazySingleton(
    () => DialogService(),
  );

  locator.registerLazySingleton(
    () => SnackbarService(),
  );

  // // locator.registerLazySingleton<ConnectivityService>(
  // //     () => ConnectivityServiceImpl());

  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  locator.registerLazySingleton<LocationService>(() => LocationServiceImpl());

  // locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  // locator.registerLazySingleton<HiveInterface>(() => Hive);

  if (!test) {
    await _setupSharedPreferences();
  }

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
  locator.registerLazySingleton<ConnectivityService>(
      () => ConnectivityServiceImpl());

  //DataSources
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
