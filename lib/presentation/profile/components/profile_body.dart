import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../profile_menu/menu.dart';

class ProfileBody extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('User')
              .where("userId", isEqualTo: auth.currentUser!.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {}
            return Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                data = document.data()! as Map<String, dynamic>;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(data!['userImage']),
                    ),
                    Text(
                      data!['userName'],
                      style: GoogleFonts.comfortaa(
                        color: ColorManager.black,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      data!['userEmail'],
                      style: GoogleFonts.comfortaa(
                        color: ColorManager.black,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.1,
                          child: Lottie.network(
                              'https://assets1.lottiefiles.com/private_files/lf30_u4mgmpw4.json'),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: ColorManager.kPrimaryColor,
                          child: Text(
                            data!['points'].toString(),
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }).toList(),
            );
          },
        ),
        ProfileMenu(
          text: "Edit Account",
          icon: "assets/icons/User Icon.svg",
          press: () => {Navigator.pushNamed(context, Routes.profileView)},
        ),
        ProfileMenu(
          text: "History",
          icon: "assets/icons/Bell.svg",
          press: () => {Navigator.pushNamed(context, Routes.history)},
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
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.signInRoute, (Route<dynamic> route) => false);
          },
        ),
        const Spacer(),
      ],
    );
  }
}
