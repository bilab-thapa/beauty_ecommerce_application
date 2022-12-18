import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/color_manager.dart';
import '../resources/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.color,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: GoogleFonts.comfortaa(
            fontSize: getProportionateScreenWidth(18),
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
