import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:beauty_e_commerce/presentation/widgets/default_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/product_model.dart';

class ProductEdit extends StatefulWidget {
  final Product product;

  const ProductEdit({super.key, required this.product});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final newName = TextEditingController();
  final newDesc = TextEditingController();
  final newPrice = TextEditingController();
  final newVideo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    newName.text = widget.product.productName;
    newPrice.text = widget.product.productPrice.toString();
    newDesc.text = widget.product.productDesc;
    newVideo.text = widget.product.videoUrl.toString();

    updateProduct() async {
      try {
        FirebaseFirestore.instance
            .collection('Product')
            .doc(widget.product.productId)
            .update({
          'productName': newName.text,
          'productPrice': newPrice.text,
          'productDesc': newDesc.text,
          'productVideo': newVideo.text,
        });
        Get.snackbar('Success', 'Changes Data');
      } on FirebaseException catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Edit",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
          textAlign: TextAlign.right,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            SizedBox(
              height: SizeConfig.screenHeight * 0.2,
              child: Image.network(widget.product.productImage),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            buildTextFeild('Name', newName),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildTextFeild('Price', newPrice),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildTextFeild('Description', newDesc),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            buildTextFeild('Video Url', newVideo),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.1),
              child: DefaultButton(
                text: 'Update',
                press: () {
                  updateProduct();
                },
                color: ColorManager.kSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildTextFeild(String? lable, TextEditingController controller) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.8,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: ColorManager.white.withOpacity(0.4),
          filled: true,
          border: const OutlineInputBorder(),
          labelText: lable,
          labelStyle: GoogleFonts.poppins(
            color: ColorManager.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          // hintText: hint,
          hintStyle: GoogleFonts.poppins(
              color: ColorManager.black,
              fontSize: 18,
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
