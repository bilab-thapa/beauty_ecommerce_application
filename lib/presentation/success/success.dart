import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../resources/routes_manager.dart';
import '../widgets/default_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Success ',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
      ),
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
            DefaultButton(
              color: ColorManager.kPrimaryColor,
              text: 'HomeScreen',
              press: () {
                Navigator.pushNamed(context, Routes.homeScreenRoute);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
