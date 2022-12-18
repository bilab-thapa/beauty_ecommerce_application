import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/data_controller.dart';
import '../product_detail/detail_screen.dart';
import '../resources/color_manager.dart';

class CategoryLipGloss extends StatelessWidget {
  const CategoryLipGloss({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getLipgloss();
    });

    return Container(
      decoration: BoxDecoration(color: ColorManager.white),
      child: Scaffold(
        backgroundColor: ColorManager.kPrimaryColor.withOpacity(0.2),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Lip Gloss',
            style: GoogleFonts.poppins(
                fontSize: 24, color: ColorManager.kTextColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: GetBuilder<DataController>(
          builder: (controller) => controller.lipGloss.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  shrinkWrap: true,
                  itemCount: controller.lipGloss.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(
                                product: controller.lipGloss[index]);
                          }));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.24,
                              width: SizeConfig.screenHeight * 0.5,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Hero(
                                  tag: controller.lipGloss[index].productId
                                      .toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        controller.lipGloss[index].productImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                "${controller.lipGloss[index].productName.capitalizeFirst}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorManager.kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Rs ${controller.lipGloss[index].productPrice.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
