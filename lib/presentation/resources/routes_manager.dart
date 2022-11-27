import 'package:beauty_e_commerce/presentation/cart_screen/cart_view.dart';
import 'package:beauty_e_commerce/presentation/home_screen/home_screen.dart';
import 'package:beauty_e_commerce/presentation/product_add/product_add.dart';
import 'package:beauty_e_commerce/presentation/profile/components/profile_edit.dart';
import 'package:beauty_e_commerce/presentation/profile/components/profile_ui.dart';
import 'package:beauty_e_commerce/presentation/profile/profile_screen.dart';
import 'package:beauty_e_commerce/presentation/resources/strings_manager.dart';
import 'package:beauty_e_commerce/presentation/success/success.dart';
import 'package:flutter/material.dart';
import '../intro_screen/intro_screen.dart';
import '../sign_in/components/sign_in_screen.dart';
import '../sign_up/components/sign_up_screen.dart';

class Routes {
  static const String initialScreenRoute = "/";
  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String homeScreenRoute = "/homeScreen";
  static const String profileRoute = "/profile";
  static const String profileView = "/profileView";
  static const String profileEdit = "/profileEdit";
  static const String productAdd = "/product";
  static const String categoryView = "/categoryView";
  static const String cartView = "/cart";
  static const String success = "/success";
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
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.profileView:
        return MaterialPageRoute(builder: (_) => ProfilePageDesign());
      case Routes.profileEdit:
        return MaterialPageRoute(builder: (_) => const ProfileEdit());
      case Routes.productAdd:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case Routes.cartView:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.success:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

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
