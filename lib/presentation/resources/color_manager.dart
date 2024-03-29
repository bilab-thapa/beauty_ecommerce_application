import 'package:flutter/material.dart';

class ColorManager {
  static Color kPrimaryColor = HexColor.fromHex("#01AE92");
  static Color kSecondaryColor = HexColor.fromHex("#f06449");
  static Color search = HexColor.fromHex("#0E89FF");
  static Color kSecondaryTextColor = HexColor.fromHex("#722C4E");
  static Color kTextColor = HexColor.fromHex("#FFFFFF");
  static Color kBuy = HexColor.fromHex("#F17441");
  static Color special = HexColor.fromHex("##FFC919");
  static Color black = HexColor.fromHex("#141619");
  static Color kPrimaryLightColor = HexColor.fromHex("#E68FAC");
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFFFFF), Color(0xFFEE9CA7)],
  );

//Dashboard Cards
  static Color dash1 = HexColor.fromHex("#CEF0D1");
  static Color dash2 = HexColor.fromHex("#D3D3F2");
  static Color dash3 = HexColor.fromHex("#F4E5B0");
  static Color dash4 = HexColor.fromHex("#F2E3D3");

//FL Charts Colors
  static Color maleColor = Colors.blueAccent;
  static Color femaleColor = Colors.pinkAccent;

// new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color greenIconColor = HexColor.fromHex("#47B14B");
  static Color bgWhite = HexColor.fromHex("#FCFCFC");
  static Color fontColorBlack = HexColor.fromHex("#1F2933");
  static Color error = HexColor.fromHex("#e61f34");
  static Color filledInputColorsForForm = HexColor.fromHex("#B0B8BF");

  static const Color colorTextFieldBorder = Color(0x1F000000);
  static const Color colorInputText = Color(0xBD000000);
  static const Color colorTextDescription = Color(0x82000000);
  static Color iconGrey = HexColor.fromHex("#9FA8B1");
  static Color fontColorLightHint = HexColor.fromHex("#7C84A0");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
