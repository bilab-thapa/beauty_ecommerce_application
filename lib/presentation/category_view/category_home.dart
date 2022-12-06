import 'package:beauty_e_commerce/presentation/category_view/category_eyes.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_skin.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_hair.dart';
import 'package:beauty_e_commerce/presentation/category_view/category_lips.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    Widget buildLipIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryLips();
          }));
        },
        child: Card(
          elevation: 10,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Lips'),
            ),
          ),
        ),
      );
    }

    Widget buildHairIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryHair();
          }));
        },
        child: Card(
          elevation: 10,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Hair'),
            ),
          ),
        ),
      );
    }

    Widget buildSkinIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategorySkin();
          }));
        },
        child: Card(
          elevation: 10,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Skin'),
            ),
          ),
        ),
      );
    }

    Widget buildEyesIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const CategoryEyes();
          }));
        },
        child: Card(
          elevation: 10,
          shadowColor: ColorManager.kPrimaryColor,
          color: ColorManager.bgWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth * 0.2,
            child: const Center(
              child: Text('Eyes'),
            ),
          ),
        ),
      );
    }

    Widget buildCategory() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildEyesIcon(),
          buildLipIcon(),
          buildHairIcon(),
          buildSkinIcon(),
        ],
      );
    }

    return buildCategory();
  }
}
