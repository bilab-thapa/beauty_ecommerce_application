import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'components/profile_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ProfilePageDesign(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
