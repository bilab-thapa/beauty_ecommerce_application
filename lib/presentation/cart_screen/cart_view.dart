import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';
import '../resources/routes_manager.dart';
import 'cart_body.dart';
import 'subtotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.history);
              },
              child: Text(
                'History',
                style: GoogleFonts.comfortaa(
                    fontSize: 18, color: ColorManager.kTextColor),
              ))
        ],
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(),
        const CartBody(),
        Container(),
        GetBuilder<DataController>(
          builder: (controller) => controller.cartProduct.isEmpty
              ? Container()
              : const Positioned(
                  bottom: 0,
                  child: SubTotal(),
                ),
        ),
      ]),
    );
  }
}
