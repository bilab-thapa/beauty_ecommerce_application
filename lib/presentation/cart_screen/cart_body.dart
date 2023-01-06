import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/data_controller.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final DataController controller = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic>? data;

  @override
  void initState() {
    controller.getCartProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (controller) => controller.cartProduct.isEmpty
          ? Center(
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.2,
                child: const Center(child: CircularProgressIndicator()),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.cartProduct.length,
              itemBuilder: (context, index) {
                final keyItem = controller.cartProduct[index];
                return Dismissible(
                  key: Key(keyItem.productId!),
                  background: Card(
                    color: ColorManager.error,
                    child: const Text('Deleted'),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      controller.deleteProduct(keyItem);
                    });
                    Get.offAndToNamed(Routes.cartView);
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 10,
                          shadowColor: ColorManager.kPrimaryColor,
                          color: ColorManager.kTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                      controller.cartProduct[index].image!),
                                ),
                                SizedBox(width: SizeConfig.screenWidth * 0.01),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.48,
                                  height: SizeConfig.screenHeight * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.cartProduct[index].productName!.capitalizeFirst}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.black),
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.02),
                                      Text(
                                        'Rs ${controller.cartProduct[index].productPrice!.toStringAsFixed(0)}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.black),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (controller.cartProduct[index]
                                                      .productQuantity! >
                                                  1) {
                                                setState(() {
                                                  controller.subQuantity(
                                                      controller
                                                          .cartProduct[index]);
                                                  Get.offAndToNamed(
                                                      Routes.cartView);
                                                });
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text(controller.cartProduct[index]
                                              .productQuantity
                                              .toString()),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                controller.addQuantity(
                                                    controller
                                                        .cartProduct[index]);
                                                Get.offAndToNamed(
                                                    Routes.cartView);
                                              });
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  addProduct(quantity) {
    setState(() {
      quantity += 1;
    });
  }

  removeProduct(quantity) {
    setState(() {
      quantity -= 1;
    });
  }
}
