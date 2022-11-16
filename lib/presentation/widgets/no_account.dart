import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/size_config.dart';
import '../resources/strings_manager.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.noAccount,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signUpRoute);
          },
          child: Text(
            AppStrings.signUp,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: ColorManager.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class YesAccountText extends StatelessWidget {
  const YesAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.yesAccount,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signInRoute);
          },
          child: Text(
            AppStrings.signIn,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: ColorManager.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
