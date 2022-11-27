import 'dart:io';

import 'package:beauty_e_commerce/controller/data_controller.dart';
import 'package:beauty_e_commerce/presentation/product_add/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  DataController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  var _userImageFile;
  Map<String, dynamic> productData = {
    "p_name": "",
    "p_price": "",
    "p_category": "",
    "p_desc": "",
    "p_data": ""
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Product'),
      ),
      body: Card(
        child: Container(
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
                  keyboardType: TextInputType.number,
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Product Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product Category Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_category'] = value!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Database Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Dataset Name Required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productData['p_data'] = value!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
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
                  onPressed: addProduct,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
