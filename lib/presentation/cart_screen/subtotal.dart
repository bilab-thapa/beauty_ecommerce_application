import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

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
            left: SizeConfig.screenWidth * 0.1,
            child: const Text('SubTotal:'),
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.1,
            left: SizeConfig.screenWidth * 0.6,
            child: Text(controller.cartTotal().toString()),
          ),
          Positioned(
              bottom: 10,
              child: ElevatedButton(
                  onPressed: () {
                    KhaltiScope.of(context).pay(
                      config: PaymentConfig(
                        amount: 1000,
                        productIdentity: 'dell-g5-g5510-2021',
                        productName: 'Dell G5 G5510 2021',
                        productUrl: 'https://www.khalti.com/#/bazaar',
                        additionalData: {
                          'vendor': 'Khalti Bazaar',
                        },
                        mobile: '9810345454',
                        mobileReadOnly: true,
                      ),
                      preferences: [
                        PaymentPreference.khalti,
                        PaymentPreference.connectIPS,
                        PaymentPreference.mobileBanking,
                        PaymentPreference.eBanking
                      ],
                      onSuccess: (successModel) {
                        Get.snackbar('Alert', 'Success',
                            snackPosition: SnackPosition.TOP);
                      },
                      onFailure: (failureModel) {
                        Get.snackbar('Alert', 'Failed',
                            snackPosition: SnackPosition.TOP);
                      },
                      // onCancel: onCancel,
                    );
                  },
                  child: const Text('Checkout'))),
        ],
      ),
    );
  }
}
