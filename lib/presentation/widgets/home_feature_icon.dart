import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/size_config.dart';

class HomeFeatureIcon extends StatelessWidget {
  const HomeFeatureIcon({Key? key, required this.svgIcon}) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon,
      height: getProportionateScreenWidth(18),
    );
    // );
  }
}
