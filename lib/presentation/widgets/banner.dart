import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/intro_screen_controller.dart';
import '../resources/color_manager.dart';
import '../resources/duration_constants.dart';
import '../resources/size_config.dart';

class BannerContent extends StatelessWidget {
  const BannerContent({this.image, this.text, super.key});

  final String? text, image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      height: getProportionateScreenHeight(265),
      width: getProportionateScreenWidth(235),
    );
  }
}

class BannerBody extends StatefulWidget {
  const BannerBody({super.key});

  @override
  BannerBodyState createState() => BannerBodyState();
}

class BannerBodyState extends State<BannerBody> {
  final BannerScreenController introScreenController =
      Get.put(BannerScreenController());


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                introScreenController.assignValue(value);
              },
              itemCount: introScreenController.bannerData.length,
              itemBuilder: (context, index) => BannerContent(
                image: introScreenController.bannerData[index].imgString,

              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introScreenController.bannerData.length,
              (index) => Obx(() => buildDot(index: index)),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: introScreenController.currentPage.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: introScreenController.currentPage.value == index
            ? ColorManager.kSecondaryColor
            : ColorManager.kSecondaryTextColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
