import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage(ImageAssets.bgimage), fit: BoxFit.fill),
          gradient: ColorManager.kPrimaryGradientColor),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SignInBody(),
      ),
    );
  }
}
