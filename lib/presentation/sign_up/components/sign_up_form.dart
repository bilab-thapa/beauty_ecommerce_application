import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beauty_e_commerce/app/constants/app_constants.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/custom_suffix_icon.dart';
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
  void clear() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1, channelKey: 'Basic', title: 'Account Registration Successful'),
    );
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    addressController.clear();
    Navigator.pushReplacementNamed(context, Routes.signInRoute);
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
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: const Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
    FirebaseFirestore.instance.collection("User").doc(result!.user!.uid).set({
      "UserName": nameController.text,
      "UserId": result.user!.uid,
      "UserEmail": emailController.text,
      "UserAddress": addressController.text,
      "UserGender": "",
    });

    setState(() {
      isLoading = false;
      clear();
    });
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
                    size: 34,
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
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.emailIcon,
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
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.lockIcon,
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
            decoration: const InputDecoration(
                suffixIcon: CustomSurffixIcon(
                  svgIcon: ImageAssets.locationPointIcon,
                ),
                hintText: AppStrings.addressTextField,
                labelText: AppStrings.address),
            onChanged: (value) {
              setState(() {
                address = value;
              });
            },
          ),
          const SizedBox(
            height: 40,
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