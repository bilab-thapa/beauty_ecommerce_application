import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageDesign extends StatefulWidget {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

final DataController controller = Get.find();

class _ProfilePageDesignState extends State<ProfilePageDesign> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;
  String? userName;
  String? userEmail;
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.kSecondaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
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
  final _newName = TextEditingController();
  final _newAddress = TextEditingController();
  // final _newEmail = TextEditingController();
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
          border: OutlineInputBorder(),
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

  return Container(
    child: Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://pub-static.fotor.com/assets/projects/pages/d5bdd0513a0740a8a38752dbc32586d0/fotor-03d1a91a0cec4542927f53c87e0599f6.jpg',
                width: SizeConfig.screenWidth * 0.45,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Divider(
          color: ColorManager.bgWhite,
          thickness: 10,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        SizedBox(
          height: SizeConfig.screenHeight * 0.47,
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
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      'Username',
                      username,
                      _newName),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  buildTextFeild(
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                      ),
                      'Address',
                      address,
                      _newAddress),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  // buildTextFeild(
                  //     Icon(
                  //       Icons.email,
                  //       color: Colors.white,
                  //     ),
                  //     'Email',
                  //     email,
                  //     _newEmail),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * 0.02,
                  // ),
                  // buildTextFeild(
                  //     Icon(
                  //       Icons.lock,
                  //       color: Colors.white,
                  //     ),
                  //     'Old Password',
                  //     '*************',
                  //     _oldPassword),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight * 0.02,
                  // ),
                  // buildTextFeild(
                  //     Icon(
                  //       Icons.lock,
                  //       color: Colors.white,
                  //     ),
                  //     'New Password',
                  //     '*************',
                  //     _newPassword),
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
              debugPrint(_newName.text);
              controller.updateUser(
                _newName.text,
                // _newEmail.text,
                // _newPassword.text,
                _newAddress.text,
                //  _oldPassword.text
              );
            },
          ),
        )
      ],
    ),
  );
}
