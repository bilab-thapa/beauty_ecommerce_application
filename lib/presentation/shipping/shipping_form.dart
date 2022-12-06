import 'package:beauty_e_commerce/models/shipping_model.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../../controller/data_controller.dart';
import '../../models/cart_model.dart';
import '../helper/keyboard_util.dart';
import '../resources/routes_manager.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  List<Cart> cartOrder = [];
  final DataController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    for (var result in controller.cartProduct) {
      cartOrder.add(Cart(
          productId: result.productId,
          productPrice: result.productPrice,
          productQuantity: result.productQuantity,
          productName: result.productName,
          image: result.image));
    }
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => KeyboardUtil.hideKeyboard(context),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.8,
          width: SizeConfig.screenWidth,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.1,
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.1,
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.1,
                    child: TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.1,
                    child: TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.9,
                    height: SizeConfig.screenHeight * 0.1,
                    child: TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: SizeConfig.screenHeight * 0.2,
                      width: SizeConfig.screenWidth * 0.9,
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: ColorManager.kPrimaryColor,
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          color: ColorManager.kSecondaryColor,
                          border: Border.all(
                            color: ColorManager.kPrimaryColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Total Price',
                            style: GoogleFonts.poppins(
                                color: ColorManager.kTextColor, fontSize: 28),
                          ),
                          Text(
                            controller.cartTotal().toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.kPrimaryColor,
                                fontSize: 28),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.8,
                            child: DefaultButton(
                              text: 'Continue to Payment',
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  vaildation();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void vaildation() async {
    if (firstNameController.text.isEmpty) {
      Get.snackbar('Alert', 'Enter FirstName',
          snackPosition: SnackPosition.TOP);
    } else if (lastNameController.text.isEmpty) {
      Get.snackbar('Alert', 'Enter LastName', snackPosition: SnackPosition.TOP);
    } else if (cityController.text.isEmpty) {
      Get.snackbar('Alert', 'Enter City', snackPosition: SnackPosition.TOP);
    } else if (addressController.text.isEmpty) {
      Get.snackbar('Alert', 'Enter Address', snackPosition: SnackPosition.TOP);
    } else if (phoneNumber.text.length > 10) {
      Get.snackbar('Alert', 'Enter Valid Number',
          snackPosition: SnackPosition.TOP);
    } else {
      String status = 'paid';
      KhaltiScope.of(context).pay(
        config: PaymentConfig(
          amount: 1000,
          productIdentity: 'dell-g5-g5510-2021',
          productName: 'Dell G5 G5510 2021',
          productUrl: 'https://www.khalti.com/#/bazaar',
          additionalData: {
            'vendor': 'Khalti Bazaar',
          },
          mobile: '9810345454',
          mobileReadOnly: true,
        ),
        preferences: [
          PaymentPreference.khalti,
          PaymentPreference.connectIPS,
          PaymentPreference.mobileBanking,
        ],
        onSuccess: (successModel) {
          Get.snackbar('Alert', 'Success', snackPosition: SnackPosition.TOP);
          controller.placeOrder(
              cartOrder,
              controller.cartTotal(),
              Shipping(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  city: cityController.text,
                  address: addressController.text,
                  number: phoneNumber.text,
                  status: status));
          Navigator.pushNamed(context, Routes.success);
        },
        onFailure: (failureModel) {
          Get.snackbar('Alert', 'Failed', snackPosition: SnackPosition.TOP);
        },
        // onCancel: onCancel,
      );
    }
  }
}
