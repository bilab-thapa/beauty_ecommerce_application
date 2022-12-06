import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data;
    return Drawer(
      backgroundColor: ColorManager.black,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorManager.kTextColor,
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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    data = document.data()! as Map<String, dynamic>;
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(data!['userImage']),
                          ),
                          Text(
                            data!['userName'],
                            style: GoogleFonts.poppins(
                              color: ColorManager.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            data!['userEmail'],
                            style: GoogleFonts.poppins(
                              color: ColorManager.black,
                              fontSize: 12,
                            ),
                          ),
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
              Navigator.pushNamed(context, Routes.cartView);
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
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.signInRoute, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
