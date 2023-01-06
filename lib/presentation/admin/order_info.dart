import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/admin_controller.dart';
import 'package:intl/intl.dart';
import '../../models/cart_model.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.comfortaa(
        fontSize: 16, fontWeight: FontWeight.bold, color: ColorManager.black);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Orders",
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<AdminController>(
          builder: (controller) => controller.orderData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.orderData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Center(
                                child: Column(
                              children: [
                                Text(
                                  'Order Details',
                                  style: style,
                                ),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Ordered By : ',
                                      style: style,
                                    ),
                                    Text(
                                      controller.orderData[index].firstName!,
                                      style: style,
                                    )
                                  ],
                                ),
                              ],
                            )),
                            content: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: style),
                                      Text('Units', style: style),
                                    ],
                                  ),
                                  SizedBox(
                                      height: SizeConfig.screenHeight * 0.02),
                                  SizedBox(
                                    height: 150,
                                    width: SizeConfig.screenWidth * 0.8,
                                    child: ListView.builder(
                                        itemCount: controller
                                            .orderData[index].orders.length,
                                        itemBuilder: (context, indexnew) {
                                          Map products = controller
                                              .orderData[index]
                                              .orders[indexnew];
                                          List<Cart> cartData = [];
                                          products.forEach((key, value) =>
                                              cartData.add(
                                                Cart(
                                                  productId:
                                                      products['productId'],
                                                  productPrice:
                                                      products['productPrice'],
                                                  productQuantity: products[
                                                      'productQuantity'],
                                                  productName:
                                                      products['productName'],
                                                  image:
                                                      products['productImage'],
                                                ),
                                              ));
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.5,
                                                  child: Text(
                                                    cartData[index]
                                                        .productName
                                                        .toString(),
                                                    style: style,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      SizeConfig.screenWidth *
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
                      child: Card(
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Order Date'),
                              Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(controller
                                        .orderData[index].timestamp
                                        .toDate())
                                    .toString(),
                                style: style,
                              ),
                            ],
                          ),
                          title: Text('Delivery Location', style: style),
                          subtitle: Text(
                            controller.orderData[index].address!,
                            style: style,
                          ),
                          trailing: Text(
                            'Rs ${controller.orderData[index].total.toStringAsFixed(0)}',
                            style: style,
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}
