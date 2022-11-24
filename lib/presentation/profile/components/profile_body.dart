import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../resources/routes_manager.dart';
import 'menu.dart';
import 'profile_image.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {Navigator.pushNamed(context, Routes.profileView)},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, Routes.signInRoute);
            },
          ),
        ],
      ),
    );
  }
}
