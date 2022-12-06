import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/color_manager.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style:
              GoogleFonts.poppins(fontSize: 24, color: ColorManager.kTextColor),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          DefaultButton(
              text: 'Reset',
              press: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                Navigator.pop(context);
                Get.snackbar('Success', 'Reset Email Sent');
              }),
        ],
      ),
    );
  }
}
