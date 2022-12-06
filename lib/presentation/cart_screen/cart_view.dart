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
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.format_list_numbered_rtl_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.history);
            },
          )
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
      // drawer: const DrawerWidget(),
    );
  }
}
