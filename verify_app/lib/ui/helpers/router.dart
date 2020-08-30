import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/screens/screens.dart';

///   - Routes are generated by the list of routes in the app
///   - Routes can also require parameters. e.g. `PostDetailView(post: post)`
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return GetRouteBase(
      settings: RouteSettings(name: settings.name),
      page: _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      //all views will be here

      case ViewRoutes.start:
        return StartScreen();

      case ViewRoutes.signin:
        return SignInScreen();

      case ViewRoutes.welcome:
        return WelcomeScreen();

      case ViewRoutes.on_boarding:
        return TourScreen();

      case ViewRoutes.home:
        return HomeSceen();
      case ViewRoutes.verification:
        return VerificationScreen();

      case ViewRoutes.singinmanually:
        return SignInManuallyScreen();

      case ViewRoutes.instructions:
        return InstructionScreen();

      case ViewRoutes.notifications:
        return NotificationScreen();

      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}
