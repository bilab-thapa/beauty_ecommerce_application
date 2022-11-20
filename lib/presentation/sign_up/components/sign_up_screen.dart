import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ColorManager.kPrimaryGradientColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SignUpBody(),
      ),
    );
  }
}
