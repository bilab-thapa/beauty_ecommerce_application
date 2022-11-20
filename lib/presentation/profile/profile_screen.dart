import 'package:beauty_e_commerce/presentation/profile/components/profile_body.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kSecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ProfileBody(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
