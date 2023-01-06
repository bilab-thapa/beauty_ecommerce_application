import 'dart:async';

import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../resources/routes_manager.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.homeScreenRoute, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.homeScreenRoute);
        },
        child: Scaffold(
          body: Container(
            color: Colors.white,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Text(
                    'Successfully Purchased Products'.toUpperCase(),
                    style: GoogleFonts.poppins(
                        color: ColorManager.kPrimaryColor, fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.6,
                  child: Stack(
                    children: [
                      Lottie.network(
                          'https://assets2.lottiefiles.com/packages/lf20_lg6lh7fp.json'),
                      Lottie.network(
                          'https://assets2.lottiefiles.com/packages/lf20_pqnfmone.json')
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
