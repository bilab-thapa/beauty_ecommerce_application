import 'package:flutter/material.dart';
import '../resources/size_config.dart';
import 'components/intro_screen_body.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: IntroScreenBody(),
    );
  }
}
