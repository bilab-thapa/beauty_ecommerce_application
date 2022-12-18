import 'dart:async';

import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.initialScreenRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_robeep7z.json'),
      ),
    ));
  }
}
