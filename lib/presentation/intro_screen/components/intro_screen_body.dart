import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/color_manager.dart';
import '../../resources/duration_constants.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/default_button.dart';
import '../../../controller/intro_screen_controller.dart';
import 'intro_screen_content.dart';

class IntroScreenBody extends StatefulWidget {
  const IntroScreenBody({super.key});

  @override
  IntroScreenBodyState createState() => IntroScreenBodyState();
}

class IntroScreenBodyState extends State<IntroScreenBody> {
  final IntroScreenController introScreenController =
      Get.put(IntroScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  introScreenController.assignValue(value);
                },
                itemCount: introScreenController.introScreenData.length,
                itemBuilder: (context, index) => IntroScreenContent(
                  image: introScreenController.introScreenData[index].imgString,
                  text: introScreenController.introScreenData[index].text,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introScreenController.introScreenData.length,
                        (index) => Obx(() => buildDot(index: index)),
                      ),
                    ),
                    const Spacer(flex: 1),
                    DefaultButton(
                      text: AppStrings.splashContinue,
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.signInRoute);
                      },
                      color: ColorManager.black,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            ? ColorManager.black
            : ColorManager.kTextColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
