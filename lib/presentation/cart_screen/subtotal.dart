import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    controller.getCartProduct();
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: SizeConfig.screenWidth * 0.1,
            left: SizeConfig.screenWidth * 0.6,
            child: Text(controller.cartTotal().toString()),
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.1,
            left: SizeConfig.screenWidth * 0.1,
            child: const Text('SubTotal:'),
          ),
          Positioned(
              bottom: 10,
              child: ElevatedButton(
                  onPressed: () {
                    return;
                  },
                  child: const Text('Checkout'))),
        ],
      ),
    );
  }
}
