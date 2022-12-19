import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen/components/footer.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.poppins(
        color: ColorManager.kTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w300);
    Map<String, dynamic>? data;
    return Drawer(
      backgroundColor: ColorManager.black,
      child: Container(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(0),
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorManager.bgWhite,
                  ),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('User')
                        .where("userId",
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Text("Loading");
                      } else {}
                      return Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          data = document.data()! as Map<String, dynamic>;
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(data!['userImage']),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data!['userName'],
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      data!['userEmail'],
                                      style: GoogleFonts.comfortaa(
                                        color: ColorManager.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_filled),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.homeScreenRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('My Cart'),
                  onTap: () {
                    Get.toNamed(Routes.cartView);
                    // Navigator.pushNamed(context, Routes.cartView);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    ' My Profile ',
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.profileRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About Us'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, Routes.aboutus);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(context,
                        Routes.signInRoute, (Route<dynamic> route) => false);
                  },
                ),

                Divider(
                  color: ColorManager.white,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'eBeauty',
                        style: style,
                      ),
                      Text(
                        'version 0.6',
                        style: style,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorManager.white,
                ),
                // const Expanded(
                //     child: SizedBox(
                //   height: 60,
                // )),
              ],
            ),
            const Positioned(bottom: 0, left: 0, right: 0, child: HomeFooter()),
          ],
        ),
      ),
    );
  }
}
