import 'package:beauty_e_commerce/controller/admin_controller.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/routes_manager.dart';
import '../resources/size_config.dart';
import '../widgets/default_button.dart';
import 'homedata/all_widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AdminController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.allUser();
      controller.getOrder();
      controller.getAllProduct();
    });

    @override
    genderData() {
      return SizedBox(
        height: SizeConfig.screenHeight * 0.3,
        width: SizeConfig.screenWidth * 0.5,
        child: GetBuilder<AdminController>(builder: (controller) {
          if (controller.maleUser.isNotEmpty) {
            final valueForPieMale = (controller.maleUser.length);
            final valueForPieFemale = (controller.femaleUser.length);

            return PieChart(
              PieChartData(sections: [
                PieChartSectionData(
                  badgeWidget: _Badge(
                    'https://cdn-icons-png.flaticon.com/512/4128/4128176.png',
                    size: SizeConfig.screenHeight * 0.1,
                    borderColor: const Color(0xff845bef),
                  ),
                  color: ColorManager.maleColor,
                  value: double.parse(valueForPieMale.toString()),
                ),
                PieChartSectionData(
                  badgeWidget: _Badge(
                    'https://cdn-icons-png.flaticon.com/512/6997/6997662.png',
                    size: SizeConfig.screenHeight * 0.1,
                    borderColor: const Color(0xff845bef),
                  ),
                  titleStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                  color: ColorManager.femaleColor,
                  value: double.parse(valueForPieFemale.toString()),
                )
              ]),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, Routes.signInRoute,
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              genderData(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TotalProduct(),
                  TotalUser(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TotalOrder(),
                  TotalSales(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(
                  text: 'Add Products',
                  press: () {
                    Navigator.pushNamed(context, Routes.productAdd);
                  },
                  color: ColorManager.kPrimaryColor,
                ),
              ),
            ],
          )),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.image, {
    required this.size,
    required this.borderColor,
  });
  final String image;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .05),
      child: Center(
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
