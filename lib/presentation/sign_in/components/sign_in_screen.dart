import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_body.dart';
import 'package:flutter/material.dart';
import '../../resources/strings_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
