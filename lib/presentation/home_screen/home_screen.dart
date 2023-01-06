import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/home_screen/components/footer.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../category_view/category_home.dart';
import '../resources/routes_manager.dart';
import '../widgets/banner.dart';
import 'components/special_for_you.dart';

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
          elevation: 10,
          title: Text(
            "HomeScreen",
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
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
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.search);
                  },
                  child: SizedBox(
                    height: SizeConfig.screenHeight * 0.07,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search',
                            style: GoogleFonts.comfortaa(
                                color: Colors.black, fontSize: 24),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * 0.05),
                          const Icon(
                            Icons.search,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const BannerBody(),
                SizedBox(height: SizeConfig.screenHeight * 0.01),

                const Category(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),

                const PopularProducts(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),

                SizedBox(
                    height: SizeConfig.screenHeight * 0.2,
                    child: const HomeFooter())
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
