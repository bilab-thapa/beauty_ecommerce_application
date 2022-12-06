import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/routes_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';

class SubTotal extends StatefulWidget {
  const SubTotal({super.key});

  @override
  State<SubTotal> createState() => _SubTotalState();
}

class _SubTotalState extends State<SubTotal> {
  final DataController controller = Get.find();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getCartProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: ColorManager.kPrimaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: SizeConfig.screenWidth * 0.05,
            left: SizeConfig.screenWidth * 0.1,
            child: Text(
              'Total',
              style: GoogleFonts.poppins(
                  color: ColorManager.kTextColor, fontSize: 28),
            ),
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.055,
            left: SizeConfig.screenWidth * 0.7,
            child: Text(
              controller.cartTotal().toString(),
              style: GoogleFonts.poppins(
                  color: ColorManager.kTextColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              bottom: SizeConfig.screenWidth * 0.05,
              left: SizeConfig.screenWidth * 0.1,
              child: SizedBox(
                width: SizeConfig.screenWidth * 0.8,
                height: SizeConfig.screenHeight * 0.08,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.kTextColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.shippingDetails);
                    },
                    child: Text(
                      'Checkout',
                      style: GoogleFonts.poppins(
                          color: ColorManager.kPrimaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    )),
              )),
        ],
      ),
    );
  }
}
