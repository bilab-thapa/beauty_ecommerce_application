import 'package:beauty_e_commerce/presentation/product_detail/detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/data_controller.dart';
import '../../../models/product_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

Product? special;

class _PopularProductsState extends State<PopularProducts> {
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
          : SizedBox(
              height: SizeConfig.screenHeight * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.specialProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(
                              product: controller.specialProducts[index]);
                        }));
                      },
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 0.95,
                            padEnds: false),
                        itemCount: index,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            width: SizeConfig.screenWidth,
                            alignment: const Alignment(-1.5, -1.0),
                            child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: SizeConfig.screenHeight * 0.3,
                                      width: SizeConfig.screenWidth * 0.45,
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height:
                                                SizeConfig.screenHeight * 0.02),
                                        Container(
                                          width: SizeConfig.screenWidth * 0.45,
                                          decoration: BoxDecoration(
                                              color: ColorManager.special,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "${controller.specialProducts[index].productName.capitalizeFirst}",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.screenHeight * 0.01),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Rs ${controller.specialProducts[index].productPrice.toStringAsFixed(0)}',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ])),
                          );
                        },
                      ));
                },
              ),
            ),
    );
  }
}
