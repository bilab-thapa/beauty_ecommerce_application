import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/data_controller.dart';
import '../product_detail/detail_screen.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class CategoryLipStick extends StatelessWidget {
  const CategoryLipStick({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getLipstick();
    });
    return Container(
      decoration:
          const BoxDecoration(gradient: ColorManager.kPrimaryGradientColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Lip Stick',
            style: GoogleFonts.poppins(
                fontSize: 24, color: ColorManager.kTextColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartView);
              },
            )
          ],
        ),
        body: GetBuilder<DataController>(
          builder: (controller) => controller.lipStick.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.lipStick.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return DetailScreen(
                                  product: controller.lipStick[index]);
                            }));
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: SizeConfig.screenHeight * 0.25,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: SizeConfig.screenHeight * 0.03,
                                  right: -SizeConfig.screenWidth * 0.02,
                                  child: SizedBox(
                                    height: SizeConfig.screenHeight * 0.2,
                                    width: SizeConfig.screenWidth * 0.6,
                                    child: Card(
                                        shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${controller.lipStick[index].productName.capitalizeFirst}",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.black),
                                            ),
                                            Text(
                                              'Rs ${controller.lipStick[index].productPrice.toStringAsFixed(0)}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.black),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  child: SizedBox(
                                    height: SizeConfig.screenHeight * 0.25,
                                    width: SizeConfig.screenWidth * 0.4,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Hero(
                                        tag: controller
                                            .lipStick[index].productId
                                            .toString(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              controller
                                                  .lipStick[index].productImage,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                          // Card(
                          //   elevation: 10,
                          //   shadowColor: ColorManager.kPrimaryColor,
                          //   color: ColorManager.bgWhite,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15.0),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child:
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         SizedBox(
                          //           height: SizeConfig.screenHeight * 0.005,
                          //         ),
                          //         SizedBox(
                          //           height: SizeConfig.screenHeight * 0.2,
                          //           child: CircleAvatar(
                          //             radius: 100,
                          //             backgroundColor: ColorManager.kPrimaryColor,
                          //             child: Hero(
                          //               tag: controller.lipStick[index].productId
                          //                   .toString(),
                          //               child: Container(
                          //                 child: Image.network(
                          //                   controller.lipStick[index].productImage,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: SizeConfig.screenHeight * 0.02,
                          //         ),
                          //         Text(
                          //           "${controller.lipStick[index].productName.capitalizeFirst}",
                          //           maxLines: 1,
                          //           style: TextStyle(
                          //               fontSize: 18,
                          //               fontWeight: FontWeight.bold,
                          //               color: ColorManager.black),
                          //         ),
                          //         Text(
                          //           'Rs ${controller.lipStick[index].productPrice.toStringAsFixed(0)}',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               color: ColorManager.black),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
