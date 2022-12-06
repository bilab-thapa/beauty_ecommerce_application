import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  var isObscureText = true.obs;
  RxBool? remember = false.obs;

  void changeRememberValue(bool value) => remember!.value = value;
}
