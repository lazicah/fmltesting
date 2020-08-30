import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/core/managers/core_manager.dart';
import 'package:verify_app/locator.dart';
import 'package:verify_app/provider_setup.dart';
import 'package:verify_app/ui/helpers/router.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/screens/camera/camerascanner.dart';

List<CameraDescription> cameras = [];

void main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();

    ///Set of locator before app
    await setupLocator();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final navigation = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers
        ..add(Provider<List<CameraDescription>>(create: (c) => cameras)),
      child: CoreManager(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: UIhelper.appName,
          theme: UIhelper.lightTheme(),
          navigatorKey: navigation.navigatorKey,
          onGenerateRoute: Router.generateRoute,
          initialRoute: ViewRoutes.start,
        ),
      ),
    );
  }
}
