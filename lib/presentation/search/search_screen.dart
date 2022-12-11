import 'package:beauty_e_commerce/models/product_model.dart';
import 'package:beauty_e_commerce/presentation/resources/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../product_detail/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
              height: SizeConfig.screenHeight * 0.5,
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
                                .toString()
                                .toLowerCase()
                                .startsWith(name.toLowerCase())) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return DetailScreen(
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
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    leading: CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          NetworkImage(data['productImage']),
                                    ),
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
        ),
      ),
    );
  }
}
