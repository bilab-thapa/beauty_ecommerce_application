import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/profile/components/profile_image.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/constants/app_constants.dart';

class ProfilePageDesign extends StatefulWidget {
  const ProfilePageDesign({super.key});

  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

final DataController controller = Get.find();

class _ProfilePageDesignState extends State<ProfilePageDesign> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: GoogleFonts.poppins(
              color: ColorManager.kTextColor,
              fontSize: 28,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('User')
                    .where("userId", isEqualTo: auth.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  return Column(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      data = document.data()! as Map<String, dynamic>;
                      return Column(
                        children: [
                          profileLayout(data!['userName'], data!['userEmail'],
                              data!['userAddress']),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

Widget profileLayout(username, email, address) {
  final newName = TextEditingController();
  // final newAddress = TextEditingController();
  final newEmail = TextEditingController();
  // final _newPassword = TextEditingController();
  // final _oldPassword = TextEditingController();

  buildTextFeild(Icon? iconName, String? lable, String? hint,
      TextEditingController controller) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.8,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: iconName,
          fillColor: ColorManager.white.withOpacity(0.4),
          filled: true,
          border: const OutlineInputBorder(),
          labelText: lable,
          labelStyle: GoogleFonts.poppins(
            color: ColorManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
              color: ColorManager.kTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }

  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      const ProfileImage(),
      Divider(
        color: ColorManager.bgWhite,
        thickness: 10,
      ),
      SizedBox(height: SizeConfig.screenHeight * 0.02),
      SizedBox(
        height: SizeConfig.screenHeight * 0.3,
        width: SizeConfig.screenWidth * 0.95,
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: ColorManager.kPrimaryColor,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                buildTextFeild(
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    'Username',
                    username,
                    newName),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                buildTextFeild(
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    'Email',
                    email,
                    newEmail),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.02,
      ),
      SizedBox(
        width: SizeConfig.screenWidth * 0.95,
        child: DefaultButton(
          text: 'Update Details',
          press: () {
            if (newName.text.isNotEmpty && newEmail.text.isNotEmpty) {
              if (!emailValidatorRegExp.hasMatch(newEmail.text)) {
                Get.snackbar('Error', 'Please Try Vaild Email');
              } else {
                controller.updateUser(
                  newName.text,
                  // newAddress.text,
                  newEmail.text,
                  // _newPassword.text,
                  //  _oldPassword.text
                );
              }
            } else {
              Get.snackbar('Error', 'Enter All Fields for Replacement');
            }

            return;
          },
          color: ColorManager.black,
        ),
      )
    ],
  );
}
