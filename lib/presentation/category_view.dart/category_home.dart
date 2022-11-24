import 'package:beauty_e_commerce/presentation/category_view.dart/category_eyes.dart';
import 'package:beauty_e_commerce/presentation/category_view.dart/category_face.dart';
import 'package:beauty_e_commerce/presentation/category_view.dart/category_hair.dart';
import 'package:beauty_e_commerce/presentation/category_view.dart/category_lips.dart';
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
    Widget _buildLipIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CategoryLips();
          }));
        },
        child: Container(
          height: SizeConfig.screenHeight * 0.1,
          width: SizeConfig.screenWidth * 0.2,
          decoration: BoxDecoration(
              color: ColorManager.kSecondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('Lips'),
          ),
        ),
      );
    }

    Widget _buildHairIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CategoryHair();
          }));
        },
        child: Container(
          height: SizeConfig.screenHeight * 0.1,
          width: SizeConfig.screenWidth * 0.2,
          decoration: BoxDecoration(
              color: ColorManager.kSecondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('Hair'),
          ),
        ),
      );
    }

    Widget _buildFaceIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CategoryFace();
          }));
        },
        child: Container(
          height: SizeConfig.screenHeight * 0.1,
          width: SizeConfig.screenWidth * 0.2,
          decoration: BoxDecoration(
              color: ColorManager.kSecondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('Face'),
          ),
        ),
      );
    }

    Widget _buildEyesIcon() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CategoryEyes();
          }));
        },
        child: Container(
          height: SizeConfig.screenHeight * 0.1,
          width: SizeConfig.screenWidth * 0.2,
          decoration: BoxDecoration(
              color: ColorManager.kSecondaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('Eyes'),
          ),
        ),
      );
    }

    Widget _buildCategory() {
      return Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  _buildEyesIcon(),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                  _buildLipIcon(),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                  _buildHairIcon(),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                  _buildFaceIcon(),
                  SizedBox(width: SizeConfig.screenWidth * 0.02),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [_buildCategory()],
        ),
      ),
    );
  }
}
