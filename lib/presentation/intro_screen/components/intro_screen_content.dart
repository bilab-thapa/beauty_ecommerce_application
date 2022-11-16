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
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
