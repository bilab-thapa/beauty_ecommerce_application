import 'package:beauty_e_commerce/presentation/admin/product_edit.dart';
import 'package:beauty_e_commerce/presentation/resources/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/admin_controller.dart';
import '../../models/product_model.dart';
import '../resources/size_config.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({super.key});

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  final AdminController controller = Get.find();
  String name = "";
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   controller.getProduct();
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Product",
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.8,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Product')
                    .snapshots(),
                builder: (context, snapshots) {
                  return (snapshots.connectionState == ConnectionState.waiting)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshots.data!.docs[index].data()
                                as Map<String, dynamic>;
                            if (data['productName']
                                .toLowerCase()
                                .startsWith(name.toLowerCase())) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return ProductEdit(
                                          product: Product(
                                              productId: data['productId'],
                                              productName: data['productName'],
                                              productPrice: double.parse(
                                                  data['productPrice']),
                                              productImage:
                                                  data['productImage'],
                                              productCategory:
                                                  data['productCategory'],
                                              productDesc: data['productDesc'],
                                              videoUrl: data['productVideo'],
                                              special: data['special']));
                                    }));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      data['productName'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorManager.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle:
                                        Text("Rs ${data['productPrice']}"),
                                    leading: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: data['productImage'] ==
                                                null
                                            ? const NetworkImage(
                                                'https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg')
                                            : NetworkImage(
                                                data['productImage'])),
                                    trailing: IconButton(
                                        onPressed: () {
                                          controller
                                              .deleteProduct(data['productId']);
                                        },
                                        icon: Icon(Icons.delete,
                                            color: ColorManager.grey1)),
                                  ),
                                ),
                              );
                            }
                            return Container();
                          });
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
