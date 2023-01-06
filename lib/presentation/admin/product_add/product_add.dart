import 'dart:io';

import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/admin/product_add/product_image.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/color_manager.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  DataController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  var _userImageFile;
  String dropdownvalue = 'Lipstick';
  String specialvalue = 'not special';

  var special = [
    'not special',
    'special',
  ];
  var category = [
    'Lipstick',
    'Lipgloss',
    'Eyeliner',
    'Mascara',
    'Foundation',
    'Moisturizer',
    'Serum',
  ];

  Map<String, dynamic> productData = {
    "p_name": "",
    "p_price": "",
    "p_category": "",
    "p_desc": "",
    "p_special": ""
  };
  void _pickedImage(File image) {
    _userImageFile = image;
  }

  addProduct() {
    if (_userImageFile == null) {
      Get.snackbar('Image Required', 'Place Image ',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.addNewProduct(productData, _userImageFile);
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Product',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Name Required';
                  }
                  return null;
                },
                onSaved: (value) {
                  productData['p_name'] = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Product Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Price Required';
                  }
                  return null;
                },
                onSaved: (value) {
                  productData['p_price'] = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration:
                    const InputDecoration(labelText: 'Product Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Price Required';
                  }
                  return null;
                },
                onSaved: (value) {
                  productData['p_desc'] = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: ColorManager.kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.2),
                  child: DropdownButton(
                    alignment: Alignment.topRight,
                    value: dropdownvalue,
                    dropdownColor: ColorManager.black,
                    iconEnabledColor: Colors.white,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 24),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    items: category.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        productData['p_category'] = dropdownvalue;
                        // debugPrint(productData['p_category']);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: ColorManager.kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.2),
                  child: DropdownButton(
                    alignment: Alignment.topRight,
                    value: specialvalue,
                    dropdownColor: ColorManager.black,
                    iconEnabledColor: Colors.white,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 24),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    items: special.map((String special) {
                      return DropdownMenuItem(
                        value: special,
                        child: Text(special),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        specialvalue = newValue!;
                        productData['p_special'] = specialvalue;
                        // debugPrint(productData['p_category']);
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Video Url'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Video Required';
                  }
                  return null;
                },
                onSaved: (value) {
                  productData['p_video'] = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ProductImagePicker(_pickedImage),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.kPrimaryColor),
                onPressed: addProduct,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
