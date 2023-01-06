import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';
import '../widgets/no_account.dart';
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
                    color: ColorManager.black,
                    fontSize: getProportionateScreenWidth(35),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  AppStrings.signUpPageText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorManager.black),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const YesAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
