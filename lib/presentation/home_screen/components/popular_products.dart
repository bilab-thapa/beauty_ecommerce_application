import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          'Popular Products',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.01),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(180),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                      color: ColorManager.bgWhite,
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: getProportionateScreenHeight(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            ImageAssets.applePay,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        bottom: 0,
                        child: Column(
                          children: [
                            Text(
                              'Smartphone',
                              style: TextStyle(
                                color: ColorManager.kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '18 Brands',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: getProportionateScreenHeight(180),
                  width: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                      color: ColorManager.bgWhite,
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: getProportionateScreenHeight(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            ImageAssets.applePay,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
