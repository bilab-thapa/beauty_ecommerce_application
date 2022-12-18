import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';

import 'package:footer/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({super.key});

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  String telUrl = 'tel:9779810345454';
  String mailUrl = 'mailto:thapabilab9@gmail.com';
  @override
  Widget build(BuildContext context) {
    void _launchDailer() async {
      if (!await launchUrl(Uri.parse(telUrl))) throw 'Could not launch';
    }

    void _launchMail() async {
      if (!await launchUrl(Uri.parse(mailUrl))) throw 'Could not launch';
    }

    return Footer(
      backgroundColor: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                    width: SizeConfig.screenWidth * 0.25,
                    child: Center(
                      child: Card(
                        elevation: 5.0,
                        color: ColorManager.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // half of height and width of Image
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.email,
                            size: 30.0,
                          ),
                          color: ColorManager.white,
                          onPressed: () {
                            _launchMail();
                          },
                        ),
                      ),
                    )),
                SizedBox(
                    height: SizeConfig.screenHeight * 0.1,
                    width: SizeConfig.screenWidth * 0.25,
                    child: Center(
                      child: Card(
                        color: ColorManager.kPrimaryColor,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // half of height and width of Image
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.call,
                            size: 30.0,
                          ),
                          color: ColorManager.white,
                          onPressed: () {
                            _launchDailer();
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const Text(
            'Copyright ©2022, All Rights Reserved.',
          ),
          const Text(
            'Powered by Flutter',
          ),
        ],
      ),
    );
  }
}
