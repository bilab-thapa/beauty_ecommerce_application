import 'package:beauty_e_commerce/presentation/product_detail/detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/data_controller.dart';
import '../../../models/product_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';

class SpecialForYou extends StatefulWidget {
  const SpecialForYou({super.key});

  @override
  State<SpecialForYou> createState() => _SpecialForYouState();
}

Product? special;

class _SpecialForYouState extends State<SpecialForYou> {
  final DataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSpecialProduct();
    });
    return GetBuilder<DataController>(
      builder: (controller) => controller.specialProducts.isEmpty
          ? const Center(
              child: Text('Loading.......'),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.specialProducts.length,
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(
                              product: controller.specialProducts[index]);
                        }));
                      },
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                        itemCount: index,
                        itemBuilder: (context, index, realIndex) {
                          return Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(children: [
                                SizedBox(
                                  height: 180,
                                  width: SizeConfig.screenWidth * 0.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Hero(
                                      tag: controller
                                          .specialProducts[index].productId
                                          .toString(),
                                      child: Image.network(
                                        controller.specialProducts[index]
                                            .productImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: SizeConfig.screenHeight * 0.02),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 0.5,
                                      child: Text(
                                        "${controller.specialProducts[index].productName.capitalizeFirst}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.black),
                                      ),
                                    ),
                                    SizedBox(
                                        height: SizeConfig.screenHeight * 0.01),
                                    Text(
                                      'Price: ${controller.specialProducts[index].productPrice.toStringAsFixed(0)}',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.black),
                                    ),
                                  ],
                                ),
                              ]));
                        },
                      )),
                );
              },
            ),
    );

    // Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: const [
    //         Text(
    //           AppStrings.specialForYou,
    //           style: TextStyle(fontSize: 26),
    //         ),
    //         InkWell(
    //           child: Text(
    //             AppStrings.seeMoreText,
    //             style: TextStyle(fontSize: 16),
    //           ),
    //         ),
    //       ],
    //     ),
    //     SizedBox(height: SizeConfig.screenHeight * 0.01),
    //     SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 15),
    //         child: Row(
    //           children: [
    //             Container(
    //               height: getProportionateScreenHeight(180),
    //               width: getProportionateScreenWidth(150),
    //               decoration: BoxDecoration(
    //                   color: ColorManager.bgWhite,
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: Stack(
    //                 children: [
    //                   Positioned.fill(
    //                     top: getProportionateScreenHeight(1),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(30),
    //                       child: Image.asset(
    //                         ImageAssets.applePay,
    //                         fit: BoxFit.contain,
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 30,
    //                     bottom: 0,
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           'Smartphone',
    //                           style: TextStyle(
    //                             color: ColorManager.kPrimaryColor,
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         const Text(
    //                           '18 Brands',
    //                           style: TextStyle(
    //                             fontFamily: 'Muli',
    //                             color: Colors.white,
    //                             fontSize: 15,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 20,
    //             ),
    //             Container(
    //               height: getProportionateScreenHeight(180),
    //               width: getProportionateScreenWidth(150),
    //               decoration: BoxDecoration(
    //                   color: ColorManager.bgWhite,
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: Stack(
    //                 children: [
    //                   Positioned.fill(
    //                     top: getProportionateScreenHeight(1),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(30),
    //                       child: Image.asset(
    //                         ImageAssets.applePay,
    //                         fit: BoxFit.contain,
    //                       ),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     left: 30,
    //                     bottom: 0,
    //                     child: Column(
    //                       children: [
    //                         Text(
    //                           'Smartphone',
    //                           style: TextStyle(
    //                             color: ColorManager.kPrimaryColor,
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         const Text(
    //                           '18 Brands',
    //                           style: TextStyle(
    //                             fontFamily: 'Muli',
    //                             color: Colors.white,
    //                             fontSize: 15,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
