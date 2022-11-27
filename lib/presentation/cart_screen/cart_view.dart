import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';
import 'cart_body.dart';
import 'subtotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
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
      bottomNavigationBar: const BottomNav(),
    );
  }
}
