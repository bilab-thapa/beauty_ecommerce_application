import 'package:beauty_e_commerce/presentation/profile/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: ProfileBody(),
      drawer: const DrawerWidget(),
    );
  }
}
