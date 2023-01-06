import 'package:beauty_e_commerce/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/default_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

bool isLoading = false;

class _SignInFormState extends State<SignInForm> {
  final SignInController _signInController = Get.put(SignInController());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;
  var uid;
  String role = 'user';

  checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('User')
        .doc(user!.uid)
        .get();

    setState(() {
      role = snap['role'];
    });
    debugPrint(role);
    if (role == 'admin') {
      Navigator.pushReplacementNamed(context, Routes.admin);
    } else if (role == 'user') {
      Navigator.pushReplacementNamed(context, Routes.homeScreenRoute);
    }
  }

  void submit(context) async {
    try {
      setState(() {
        isLoading = true;
      });

      UserCredential? result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      uid = result.user!.uid;

      await checkRole();
    } on PlatformException {
      Get.snackbar('Error', "Please Check Your Internet Connection ");

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      Get.snackbar('Error', 'Incorrect Email or Password');
      setState(() {
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              // Obx(
              //   () => Checkbox(
              //     value: _signInController.remember!.value,
              //     activeColor: ColorManager.kPrimaryColor,
              //     onChanged: (value) {
              //       _signInController.changeRememberValue(value!);
              //     },
              //   ),
              // ),
              // const Text(AppStrings.rememberMe),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.forgot);
                },
                child: const Text(
                  AppStrings.forgotPassword,
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: AppStrings.signIn,
            press: () {
              if (formKey.currentState!.validate()) {
                submit(context);
              }
            },
            color: ColorManager.kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Obx buildPasswordFormField() {
    return Obx(
      () => TextFormField(
        controller: passwordController,
        obscureText: _signInController.isObscureText.value,
        cursorColor: ColorManager.grey1,
        decoration: InputDecoration(
          labelText: AppStrings.password,
          hintText: AppStrings.enterPassword,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusColor: ColorManager.kPrimaryColor,
          suffixIcon: InkWell(
            onTap: (() {
              _signInController.isObscureText.value =
                  !_signInController.isObscureText.value;
            }),
            child: Icon(
              _signInController.isObscureText.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: ColorManager.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppStrings.email,
        // labelStyle: TextStyle(color: ColorManager.kPrimaryColor),
        hintText: AppStrings.enterEmail,
        suffixIcon: Icon(
          Icons.email,
          color: ColorManager.kPrimaryColor,
        ),
      ),
    );
  }
}
