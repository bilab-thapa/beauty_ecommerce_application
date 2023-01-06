import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/admin_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';

class TotalOrder extends StatelessWidget {
  const TotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) => controller.orderData.isEmpty
          ? SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.orderSearch);
                },
                child: Card(
                  color: ColorManager.dash3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total Order',
                        style: GoogleFonts.poppins(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      Text(
                        controller.orderData.length.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black,
                            fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class TotalSales extends StatelessWidget {
  const TotalSales({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) => controller.orderData.isEmpty
          ? SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: Card(
                color: ColorManager.dash1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sales Amount',
                      style: GoogleFonts.poppins(
                          color: ColorManager.black, fontSize: 20),
                    ),
                    Text(
                      controller.totalPrice.toStringAsFixed(0),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                          fontSize: 34),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class TotalUser extends StatelessWidget {
  const TotalUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) => controller.user.isEmpty
          ? SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.userSearch);
                },
                child: Card(
                  color: ColorManager.dash2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total User',
                        style: GoogleFonts.poppins(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      Text(
                        controller.user.length.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black,
                            fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class TotalProduct extends StatelessWidget {
  const TotalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) => controller.allProducts.isEmpty
          ? SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: const Center(child: CircularProgressIndicator()),
            )
          : SizedBox(
              width: SizeConfig.screenWidth * 0.45,
              height: SizeConfig.screenHeight * 0.25,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.productSearch);
                },
                child: Card(
                  color: ColorManager.dash4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total Product',
                        style: GoogleFonts.poppins(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      Text(
                        controller.allProducts.length.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black,
                            fontSize: 34),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
