import 'package:beauty_e_commerce/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../app/constants/app_constants.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/default_button.dart';
import '../../widgets/form_error.dart';

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
  void submit(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential? result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Navigator.pushReplacementNamed(context, Routes.homeScreenRoute);
      debugPrint(result.user!.uid.toString());
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: const Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (error) {
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
              Obx(
                () => Checkbox(
                  value: _signInController.remember!.value,
                  activeColor: ColorManager.kPrimaryColor,
                  onChanged: (value) {
                    _signInController.changeRememberValue(value!);
                  },
                ),
              ),
              const Text(AppStrings.rememberMe),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: _signInController.errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: AppStrings.signIn,
            press: () {
              if (formKey.currentState!.validate()) {
                submit(context);
              }
            },
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
        onSaved: (newValue) => _signInController.password = newValue,
        cursorColor: ColorManager.grey1,
        onChanged: (value) {
          if (value.isNotEmpty) {
            _signInController.removeError(error: AppStrings.kPassNullError);
          } else if (value.length <= 6) {
            _signInController.removeError(error: AppStrings.kShortPassError);
          }
          return;
        },
        validator: (value) {
          if (value!.isEmpty) {
            _signInController.addError(error: AppStrings.kPassNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: AppStrings.password,
          hintText: AppStrings.enterPassword,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // focusColor: ColorManager.kPrimaryColor,
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
      onSaved: (newValue) => _signInController.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _signInController.removeError(error: AppStrings.kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          _signInController.removeError(error: AppStrings.kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          _signInController.addError(error: AppStrings.kEmailNullError);
          return AppStrings.emptyString;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          _signInController.addError(error: AppStrings.kInvalidEmailError);
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.email,
        hintText: AppStrings.enterEmail,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email,
          color: ColorManager.kPrimaryColor,
        ),
      ),
    );
  }
}
