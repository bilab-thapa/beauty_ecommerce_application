import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.085,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.kPrimaryColor,
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: ColorManager.dash1,
          ),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: ColorManager.black,
                width: 22,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: GoogleFonts.comfortaa(
                    fontSize: 18, color: ColorManager.black),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
