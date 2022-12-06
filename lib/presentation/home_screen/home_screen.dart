import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_home.dart';
import 'package:beauty_e_commerce/presentation/home_screen/components/special_for_you.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/banner.dart';
import 'package:beauty_e_commerce/presentation/widgets/drawer.dart';
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
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartView);
              },
            )
          ],
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
                const BannerBody(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
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
        drawer: const DrawerWidget(),
      ),
    );
  }
}
