import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/data_controller.dart';
import '../product_detail/detail_screen.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class CategoryEyes extends StatelessWidget {
  const CategoryEyes({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getEyesProduct();
    });

    return Container(
      decoration: BoxDecoration(gradient: ColorManager.kPrimaryGradientColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Eyes',
            style: GoogleFonts.poppins(
                fontSize: 24, color: ColorManager.kTextColor),
          ),
        ),
        body: GetBuilder<DataController>(
          builder: (controller) => controller.eyes.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 20),
                  shrinkWrap: true,
                  itemCount: controller.eyes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(
                                product: controller.eyes[index]);
                          }));
                        },
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
                                  height: SizeConfig.screenHeight * 0.02,
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.2,
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor:
                                        ColorManager.kSecondaryColor,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        controller.eyes[index].productImage,
                                      ),
                                      radius: 70,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight * 0.02,
                                ),
                                Text(
                                  "${controller.eyes[index].productName.capitalizeFirst}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.black),
                                ),
                                Text(
                                  'Rs ${controller.eyes[index].productPrice.toStringAsFixed(0)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
