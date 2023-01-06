import 'package:beauty_e_commerce/presentation/about_us/about_us_screen.dart';
import 'package:beauty_e_commerce/presentation/admin/charts/line_chart.dart';
import 'package:beauty_e_commerce/presentation/admin/dashboard.dart';
import 'package:beauty_e_commerce/presentation/admin/order_info.dart';
import 'package:beauty_e_commerce/presentation/admin/product_search.dart';
import 'package:beauty_e_commerce/presentation/forgot_password/forgotpassword.dart';
import 'package:beauty_e_commerce/presentation/history/history_screen.dart';
import 'package:beauty_e_commerce/presentation/home_screen/home_screen.dart';
import 'package:beauty_e_commerce/presentation/admin/product_add/product_add.dart';
import 'package:beauty_e_commerce/presentation/profile/components/profile_ui.dart';
import 'package:beauty_e_commerce/presentation/profile/profile_screen.dart';
import 'package:beauty_e_commerce/presentation/resources/strings_manager.dart';
import 'package:beauty_e_commerce/presentation/search/search_screen.dart';
import 'package:beauty_e_commerce/presentation/shipping/shipping_main.dart';
import 'package:beauty_e_commerce/presentation/success/success.dart';
import 'package:beauty_e_commerce/presentation/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../admin/user_search.dart';
import '../cart_screen/cart_view.dart';
import '../intro_screen/intro_screen.dart';
import '../sign_in/components/sign_in_screen.dart';
import '../sign_up/sign_up_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String initialScreenRoute = "/";
  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String homeScreenRoute = "/homeScreen";
  static const String profileRoute = "/profile";
  static const String profileView = "/profileView";
  static const String productAdd = "/product";
  static const String categoryView = "/categoryView";
  static const String cartView = "/cart";
  static const String shippingDetails = "/shippping";
  static const String success = "/success";
  static const String forgot = "/forgot";
  static const String history = "/history";
  static const String aboutus = "/aboutus";
  static const String search = "/search";
  static const String admin = "/admin";
  static const String userSearch = "/userSearch";
  static const String productSearch = "/productSearch";
  static const String orderSearch = "/orderSearch";
  static const String lineChart = "/lineChart";
}

class Routegenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialScreenRoute:
        return PageTransition(
          child: const IntroScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const IntroScreen());
      case Routes.signInRoute:
        return PageTransition(
          child: const SignInScreen(),
          type: PageTransitionType.leftToRight,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpRoute:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.leftToRight,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreenRoute:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profileRoute:
        return PageTransition(
          child: const ProfileScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.profileView:
        return PageTransition(
          child: ProfilePageDesign(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => ProfilePageDesign());
      case Routes.productAdd:
        return PageTransition(
          child: const AddProductScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case Routes.cartView:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.success:
        return PageTransition(
          child: const SuccessScreen(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case Routes.shippingDetails:
        return MaterialPageRoute(builder: (_) => const ShippingScreen());
      case Routes.forgot:
        return PageTransition(
          child: const ForgotPassword(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case Routes.history:
        return PageTransition(
          child: const History(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      case Routes.aboutus:
        return PageTransition(
          child: const AboutUsPage(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const History());
      case Routes.search:
        return PageTransition(
          child: const SearchScreen(),
          type: PageTransitionType.topToBottom,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.admin:
        return PageTransition(
          child: const Dashboard(),
          type: PageTransitionType.topToBottom,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const Dashboard());
      case Routes.userSearch:
        return PageTransition(
          child: const UserSearch(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      // return MaterialPageRoute(builder: (_) => const UserSearch());
      case Routes.productSearch:
        return PageTransition(
          child: const ProductSearch(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );

      // return MaterialPageRoute(builder: (_) => const ProductSearch());
      case Routes.orderSearch:
        return PageTransition(
          child: const OrderDetail(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      case Routes.lineChart:
        return PageTransition(
          child: const LinechartScreens(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400),
        );
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

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
