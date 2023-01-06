import 'package:beauty_e_commerce/controller/admin_controller.dart';
import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/firebase_options.dart';
import 'package:beauty_e_commerce/presentation/resources/routes_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

const khaltiKey = 'test_public_key_c9a943eb7776413c875d356db551b5b1';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(DataController());
  Get.put(AdminController());
  // AwesomeNotifications().initialize('resource://drawable/logo', [
  //   NotificationChannel(
  //       channelKey: "Basic",
  //       channelName: "Basic Notification",
  //       channelDescription: "This is High Priority",
  //       defaultColor: Colors.amber,
  //       importance: NotificationImportance.Max,
  //       ledColor: Colors.white,
  //       channelShowBadge: true)
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: khaltiKey,
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            theme: theme(),
            onGenerateRoute: Routegenerator.getRoute,
            initialRoute: Routes.splash,
          );
        });
  }
}
