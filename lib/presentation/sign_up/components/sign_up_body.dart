import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/no_account.dart';
import '../../widgets/social_card.dart';
import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Text(
                  AppStrings.registerAccount,
                  style: TextStyle(
                    color: ColorManager.kPrimaryColor,
                    fontSize: getProportionateScreenWidth(35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  AppStrings.signUpPageText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: ImageAssets.googleIcon,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ImageAssets.facebookIcon,
                      press: () {},
                    ),
                    SocialCard(
                      icon: ImageAssets.twitterIcon,
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const YesAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
