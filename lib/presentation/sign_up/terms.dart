import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.comfortaa(fontSize: 12);
    return AlertDialog(
        title: const Center(
            child: Text(
          'Terms and Conditions',
        )),
        content: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppStrings.term1,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term2,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term3,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term4,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term5,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term6,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  AppStrings.term7,
                  textAlign: TextAlign.justify,
                  style: style,
                ),
              ],
            ),
          ),
        ));
  }
}
