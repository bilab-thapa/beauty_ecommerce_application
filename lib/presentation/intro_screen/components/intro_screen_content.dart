import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';

class IntroScreenContent extends StatelessWidget {
  const IntroScreenContent({this.image, this.text, super.key});

  final String? text, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          AppStrings.appTitle,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: ColorManager.kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorManager.kTextColor),
        ),
        const Spacer(
          flex: 2,
        ),
        CircleAvatar(
          radius: SizeConfig.screenHeight * 0.25,
          backgroundColor: ColorManager.white,
          child: Image.asset(
            image!,
            height: getProportionateScreenHeight(250),
            width: getProportionateScreenWidth(230),
          ),
        )
      ],
    );
  }
}
