import 'package:beauty_e_commerce/presentation/resources/assets_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        color: Colors.green.shade400,
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
            const Spacer(),
            Image.asset(
              ImageAssets.successImage,
            ),
            const Spacer(),
            DefaultButton(
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
