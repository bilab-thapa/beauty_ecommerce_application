import 'package:beauty_e_commerce/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(),
        const CartBody(),
        Container(),
        // const Positioned(
        //   bottom: 0,
        //   child: SubTotal(),
        // ),
      ]),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
