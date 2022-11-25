import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_home.dart';
import 'package:beauty_e_commerce/presentation/home_screen/components/special_for_you.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/banner.dart';
import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/routes_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController controller = Get.find();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getUserProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

    return Container(
      color: ColorManager.bgWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: key,
        appBar: AppBar(
          title: Text(
            "HomeScreen",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const BannerScreen(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const Category(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  'Special For You',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: SpecialForYou(),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                // PopularProducts()
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorManager.black,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorManager.kPrimaryColor,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorManager.kPrimaryColor,
                  ),
                  accountName: Text(
                    controller.user[0].userName!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(controller.user[0].userEmail!),
                  currentAccountPictureSize: const Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: ColorManager.kSecondaryColor,
                    child: Text(
                      controller.user[0].userName![0].toString().toUpperCase(),
                      style: GoogleFonts.poppins(
                          fontSize: 30.0, color: ColorManager.black),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  ' My Profile ',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Go Pro '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text(' Saved Videos '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.popAndPushNamed(context, Routes.signInRoute);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
