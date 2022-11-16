import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';
import 'home_feature_icon.dart';

class HomeFeaturesWidget extends StatelessWidget {
  final String? cardTitle;
  final String? cardIcon;
  const HomeFeaturesWidget({
    Key? key,
    this.cardIcon,
    this.cardTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getProportionateScreenHeight(60),
          width: getProportionateScreenWidth(60),
          decoration: BoxDecoration(
              color: ColorManager.kPrimaryLightColor,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: HomeFeatureIcon(
              svgIcon: cardIcon!,
            ),
          ),
        ),
        Text(cardTitle!)
      ],
    );
  }
}
