import 'package:beauty_e_commerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import '../intro_screen/intro_screen.dart';
import '../sign_in/components/sign_in_screen.dart';
import '../sign_up/components/sign_up_screen.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String homeScreenRoute = "/homeScreen";
}

class Routegenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRouteFound),
            ),
            body: const Center(
              child: Text(AppStrings.noRouteFound),
            )));
  }
}
