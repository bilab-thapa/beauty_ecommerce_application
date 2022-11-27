import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/no_account.dart';
import '../../widgets/social_card.dart';

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
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    AppStrings.welcomeBack,
                    style: TextStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: getProportionateScreenWidth(35),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  const SignInForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
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
