import 'package:beauty_e_commerce/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Image.asset(ImageAssets.successIcon)],
        ),
      ),
    );
  }
}
