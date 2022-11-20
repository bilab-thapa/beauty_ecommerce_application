import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class DataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'userEmail': '', 'userAddress': ''};

  List<Product> specialProducts = [];
  List<Product> lips = [];
  List<Product> hair = [];
  List<Product> face = [];
  List<Product> eyes = [];

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
      var response =
          FirebaseFirestore.instance.collection(productdata['p_data']).add({
        'productId': new DateTime.now().millisecondsSinceEpoch.toString(),
        'productName': productdata['p_name'],
        'productPrice': productdata['p_price'],
        'productDesc': productdata['p_desc'],
        'productImage': imageUrl,
        "productCategory": productdata['p_category'],
        "productVideo": productdata['p_video']
      });
      print(response.toString());
      print("Firebase response1111 $response");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  Future<void> getSpecialProduct() async {
    specialProducts = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance.collection('special').get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            lodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
            ));
          },
        );
      }
      specialProducts.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  Future<void> getLipsProduct() async {
    lips = [];
    try {
      final List<Product> liplodadedProduct = [];
      var response = await firebaseInstance.collection('lips').get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            liplodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
            ));
          },
        );
      }
      lips.addAll(liplodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  Future<void> getHairProduct() async {
    hair = [];
    try {
      final List<Product> hairlodadedProduct = [];
      var response = await firebaseInstance.collection('hair').get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            hairlodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
            ));
          },
        );
      }
      hair.addAll(hairlodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  Future<void> getFaceProduct() async {
    face = [];
    try {
      final List<Product> facelodadedProduct = [];
      var response = await firebaseInstance.collection('face').get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            facelodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
            ));
          },
        );
      }
      face.addAll(facelodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  Future<void> getEyesProduct() async {
    eyes = [];
    try {
      final List<Product> eyeslodadedProduct = [];
      var response = await firebaseInstance.collection('face').get();

      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            eyeslodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
            ));
          },
        );
      }
      face.addAll(eyeslodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  Future<void> updateUser(
    String userName,
    // String userEmail,
    // String userPassword,
    String userAddress,
    // String oldPassword
  ) async {
    try {
      await firebaseInstance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "userName": userName,
        "userAddress": userAddress,
        // "userEmail": userEmail
      });
      // print(FirebaseAuth.instance.currentUser!.uid);
      // if (oldPassword.length >= 6 && userPassword.length >= 6) {
      //   final respons = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //       email: FirebaseAuth.instance.currentUser!.email!,
      //       password: oldPassword);
      //   print(respons);
      // }
      // FirebaseAuth.instance.currentUser!.updatePassword(userPassword);
      // FirebaseAuth.instance.currentUser!.updatePassword(userEmail);
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }
}
