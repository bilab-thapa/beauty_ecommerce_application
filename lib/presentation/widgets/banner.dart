import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.kPrimaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A summer surprise',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text('Cashback 20%',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 38,
                )),
          ],
        ),
      ),
    );
  }
}
