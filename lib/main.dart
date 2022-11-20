import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/resources/routes_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(DataController());
  AwesomeNotifications().initialize('resource://drawable/logo', [
    NotificationChannel(
        channelKey: "Basic",
        channelName: "Basic Notification",
        channelDescription: "This is High Priority",
        defaultColor: Colors.amber,
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beauty',
      theme: theme(),
      onGenerateRoute: Routegenerator.getRoute,
      initialRoute: Routes.productAdd,
    );
  }
}
