import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'userEmail': '', 'userAddress': ''};

  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('User')
          .where('userId', isEqualTo: auth.currentUser!.uid)
          .get();

      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['userName'];
        userProfileData['userEmail'] = response.docs[0]['userEmail'];
        userProfileData['userAddress'] = response.docs[0]['userAddress'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      var response = FirebaseFirestore.instance.collection("Products").add({
        'productName': productdata['p_name'],
        'productPrice': productdata['p_price'],
        "product_upload_date": productdata['p_upload_date'],
        'productImage': imageUrl,
        "productCategory": productdata['p_category'],
      });
      print("Firebase response1111 $response");

      Get.back();
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }
}
