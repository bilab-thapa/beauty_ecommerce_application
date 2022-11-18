import 'package:beauty_e_commerce/presentation/profile/components/profile_body.dart';
import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ProfileBody(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
