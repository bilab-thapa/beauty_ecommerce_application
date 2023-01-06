import 'package:beauty_e_commerce/presentation/about_us/about_us_screen.dart';
import 'package:beauty_e_commerce/presentation/home_screen/components/footer.dart';
import 'package:beauty_e_commerce/presentation/profile/profile_menu/menu.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_screen.dart';
import 'package:beauty_e_commerce/presentation/sign_up/sign_up_screen.dart';
import 'package:beauty_e_commerce/presentation/widgets/banner.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:beauty_e_commerce/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  Widget makeTestableWidget({Widget? child}) {
    SizeConfig.screenWidth = 400;
    SizeConfig.screenHeight = 760;
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('SignInPage', (WidgetTester tester) async {
    SignInScreen page = const SignInScreen();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });
  testWidgets('SignUpPage', (WidgetTester tester) async {
    SignUpScreen page = const SignUpScreen();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });

  testWidgets('HomeScreen Banner', (WidgetTester tester) async {
    BannerBody page = const BannerBody();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });

  testWidgets('About Screen', (WidgetTester tester) async {
    AboutUsPage page = const AboutUsPage();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });

  testWidgets('Contact Section', (WidgetTester tester) async {
    HomeFooter page = const HomeFooter();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });
  testWidgets('Drawer Section', (WidgetTester tester) async {
    DrawerWidget page = const DrawerWidget();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });
  testWidgets('Default Button ', (WidgetTester tester) async {
    DefaultButton page = DefaultButton(
      text: 'test',
      color: ColorManager.kPrimaryColor,
    );
    await tester.pumpWidget(makeTestableWidget(child: page));
  });

  testWidgets('Wrong Default Button ', (WidgetTester tester) async {
    DefaultButton page = const DefaultButton();
    await tester.pumpWidget(makeTestableWidget(child: page));
  });
  testWidgets('Profile Menu', (WidgetTester tester) async {
    ProfileMenu page = const ProfileMenu(
      text: 'test',
      icon: "assets/icons/Log out.svg",
    );
    await tester.pumpWidget(makeTestableWidget(child: page));
  });
}
