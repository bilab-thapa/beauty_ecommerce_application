import 'package:beauty_e_commerce/presentation/category_view/category_eyeliner.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_foundation.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_lip_gloss.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_lipstick.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_mascara.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_serum.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import 'category_moisturizer.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    Widget buildLipStickIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryLipStick();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Lip Stick'),
            ),
          ),
        ),
      );
    }

    Widget buildLipGlossIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryLipGloss();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Lip Gloss'),
            ),
          ),
        ),
      );
    }

    Widget buildEyeLinerIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryEyeLiner();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Eye Liner'),
            ),
          ),
        ),
      );
    }

    Widget buildMascaraIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryMascara();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Mascara'),
            ),
          ),
        ),
      );
    }

    Widget buildFoundation() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryFoundation();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.25,
            child: const Center(
              child: Text('Foundation'),
            ),
          ),
        ),
      );
    }

    Widget buildMoisturizer() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryMoisturizer();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.25,
            child: const Center(
              child: Text('Moisturizer'),
            ),
          ),
        ),
      );
    }

    Widget buildSerum() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategorySerum();
          }));
        },
        child: Card(
          elevation: 3,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.25,
            child: const Center(
              child: Text('Serum'),
            ),
          ),
        ),
      );
    }

    Widget buildCategory() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: [
                  buildLipStickIcon(),
                  buildLipGlossIcon(),
                  buildEyeLinerIcon(),
                  buildMascaraIcon(),
                ],
              ),
              Row(
                children: [
                  buildFoundation(),
                  buildSerum(),
                  buildMoisturizer(),
                ],
              )
            ],
          ),
        ),
      );
    }

    return buildCategory();
  }
}
