import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
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
    List<OrderProduct> cartOrder = [];

    for (var result in controller.cartProduct) {
      cartOrder.add(
        OrderProduct(
          productPrice: result.productPrice,
          productName: result.productName,
          image: result.image,
          productQuantity: result.productQuantity,
        ),
      );
    }

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
            top: SizeConfig.screenWidth * 0.05,
            left: SizeConfig.screenWidth * 0.1,
            child: Text(
              'Total',
              style:
                  GoogleFonts.poppins(color: ColorManager.black, fontSize: 28),
            ),
          ),
          Positioned(
            top: SizeConfig.screenWidth * 0.055,
            left: SizeConfig.screenWidth * 0.7,
            child: Text(
              controller.cartTotal().toString(),
              style: GoogleFonts.poppins(
                  color: ColorManager.black,
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
                      backgroundColor: ColorManager.kPrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    // onPressed: () {
                    //   KhaltiScope.of(context).pay(
                    //     config: PaymentConfig(
                    //       amount: 1000,
                    //       productIdentity: 'dell-g5-g5510-2021',
                    //       productName: 'Dell G5 G5510 2021',
                    //       productUrl: 'https://www.khalti.com/#/bazaar',
                    //       additionalData: {
                    //         'vendor': 'Khalti Bazaar',
                    //       },
                    //       mobile: '9810345454',
                    //       mobileReadOnly: true,
                    //     ),
                    //     preferences: [
                    //       PaymentPreference.khalti,
                    //       PaymentPreference.connectIPS,
                    //       PaymentPreference.mobileBanking,
                    //     ],
                    //     onSuccess: (successModel) {
                    //       Get.snackbar('Alert', 'Success',
                    //           snackPosition: SnackPosition.TOP);
                    //       print(cartOrder);
                    //       controller.placeOrder(Orders(
                    //           totalPrice: controller.cartTotal(),
                    //           product: cartOrder));
                    //       Navigator.pushNamed(context, Routes.success);
                    //     },
                    //     onFailure: (failureModel) {
                    //       Get.snackbar('Alert', 'Failed',
                    //           snackPosition: SnackPosition.TOP);
                    //     },
                    //     // onCancel: onCancel,
                    //   );
                    // },
                    child: const Text('Checkout')),
              )),
        ],
      ),
    );
  }
}
