import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin_controller.dart';

class LinechartScreens extends StatefulWidget {
  const LinechartScreens({super.key});

  @override
  State<LinechartScreens> createState() => LineChartScreenScreensState();
}

class LineChartScreenScreensState extends State<LinechartScreens> {
  final AdminController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.allUser();
    });
    return Container(
      color: Colors.red,
      height: SizeConfig.screenHeight * 0.1,
      child: GetBuilder<AdminController>(
          builder: (controller) => controller.user.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container()),
    );
  }
}
