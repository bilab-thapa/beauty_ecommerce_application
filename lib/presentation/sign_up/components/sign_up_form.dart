import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beauty_e_commerce/app/constants/app_constants.dart';
import 'package:beauty_e_commerce/presentation/helper/keyboard_util.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/sign_in/components/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/default_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

String? userName;
String? email;
String? password;
String? address;
bool isLoading = false;

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  String? select;
  void clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    addressController.clear();
    KeyboardUtil.hideKeyboard(context);
    Get.snackbar('Congratulations', 'Registration Successful',
        snackPosition: SnackPosition.TOP);
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignInScreen()));
    });
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
  }

  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void submit() async {
    UserCredential? result;
    try {
      setState(() {
        isLoading = true;
      });
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on PlatformException {
      Get.snackbar('Error', 'Please Check Your Internet Connection',
          snackPosition: SnackPosition.TOP);
    } catch (error) {
      setState(() {
        isLoading = false;
      });

      Get.snackbar('Error', 'User Already Exists',
          snackPosition: SnackPosition.TOP);
    }
    FirebaseFirestore.instance.collection("User").doc(result!.user!.uid).set({
      "userName": nameController.text,
      "userId": result.user!.uid,
      "userEmail": emailController.text,
      "userAddress": addressController.text,
      "userGender": select,
      "userImage": "",
    });

    setState(() {
      isLoading = false;
      clear();
    });
  }

  List gender = ["Male", "Female"];

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: ColorManager.kPrimaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

  void vaildation() async {
    if (userName.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter Username"),
        ),
      );
    } else if (userName.toString().length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username is short"),
        ),
      );
    } else if (email.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!emailValidatorRegExp.hasMatch(email.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
    } else if (password.toString().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.toString().length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    } else {
      submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(10)),
                  child: Icon(
                    Icons.person,
                    color: ColorManager.kPrimaryColor,
                  ),
                ),
                hintText: AppStrings.userName,
                labelText: AppStrings.userNameTextField),
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(10)),
                  child: Icon(
                    Icons.email,
                    color: ColorManager.kPrimaryColor,
                  ),
                ),
                hintText: AppStrings.enterEmail,
                labelText: AppStrings.email),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(10)),
                  child: Icon(
                    Icons.lock,
                    color: ColorManager.kPrimaryColor,
                  ),
                ),
                hintText: AppStrings.enterPassword,
                labelText: AppStrings.password),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(10),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(10)),
                  child: Icon(
                    Icons.location_on,
                    color: ColorManager.kPrimaryColor,
                  ),
                ),
                hintText: AppStrings.addressTextField,
                labelText: AppStrings.address),
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          Row(
            children: <Widget>[
              addRadioButton(0, 'Male'),
              addRadioButton(1, 'Female'),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          DefaultButton(
              text: AppStrings.signUp,
              press: () {
                if (_formKey.currentState!.validate()) {
                  vaildation();
                }
              })
        ],
      ),
    );
  }
}
