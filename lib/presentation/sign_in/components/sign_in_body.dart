import 'package:beauty_e_commerce/presentation/resources/assets_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/no_account.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.2,
                    width: SizeConfig.screenWidth,
                    child: Image.asset(
                      ImageAssets.logo,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.welcomeBack,
                      style: GoogleFonts.comfortaa(
                        color: ColorManager.black,
                        fontSize: getProportionateScreenWidth(40),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  const SignInForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
