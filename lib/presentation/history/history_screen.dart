import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';
import '../../models/cart_model.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getOrder();
    });
    final style = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: ColorManager.black);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<DataController>(
        builder: (controller) => controller.orderData.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.orderData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shadowColor: ColorManager.kPrimaryColor,
                      color: ColorManager.bgWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Name : ',
                                  style: style,
                                ),
                                Text(
                                    "${controller.orderData[index].firstName!.capitalizeFirst}",
                                    style: style),
                                SizedBox(
                                  width: SizeConfig.screenWidth * 0.02,
                                ),
                                Text(
                                    "${controller.orderData[index].lastName!.capitalizeFirst}",
                                    style: style),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                Text('Delivery Location : ', style: style),
                                Text(
                                    "${controller.orderData[index].city!.capitalizeFirst}",
                                    style: style),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Contact Details : ', style: style),
                                Text(
                                  controller.orderData[index].phoneNumber!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total Amount : ', style: style),
                                Text(
                                    'Rs ${controller.orderData[index].total.toStringAsFixed(0)}',
                                    style: style),
                                SizedBox(width: SizeConfig.screenWidth * 0.05),
                                Text('Status: ', style: style),
                                CircleAvatar(
                                    radius: 10,
                                    backgroundColor: controller
                                                .orderData[index].status
                                                .toString()
                                                .toUpperCase() ==
                                            'PAID'
                                        ? ColorManager.greenIconColor
                                        : ColorManager.error),
                                // Text(
                                //     controller.orderData[index].status
                                //         .toString()
                                //         .toUpperCase(),
                                //     style: style),
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Center(
                                          child: Text('Order Details')),
                                      content: Center(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Name', style: style),
                                                Text('Units', style: style),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    SizeConfig.screenHeight *
                                                        0.02),
                                            SizedBox(
                                              height: 150,
                                              width:
                                                  SizeConfig.screenWidth * 0.8,
                                              child: ListView.builder(
                                                  itemCount: controller
                                                      .orderData[index]
                                                      .orders
                                                      .length,
                                                  itemBuilder:
                                                      (context, indexnew) {
                                                    Map products = controller
                                                        .orderData[index]
                                                        .orders[indexnew];
                                                    List<Cart> cartData = [];
                                                    products.forEach((key,
                                                            value) =>
                                                        cartData.add(
                                                          Cart(
                                                            productId: products[
                                                                'productId'],
                                                            productPrice: products[
                                                                'productPrice'],
                                                            productQuantity:
                                                                products[
                                                                    'productQuantity'],
                                                            productName: products[
                                                                'productName'],
                                                            image: products[
                                                                'productImage'],
                                                          ),
                                                        ));
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.5,
                                                            child: Text(
                                                              cartData[index]
                                                                  .productName
                                                                  .toString(),
                                                              style: style,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.1,
                                                          ),
                                                          Text(
                                                            cartData[index]
                                                                .productQuantity
                                                                .toString(),
                                                            style: style,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Show Details'))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
