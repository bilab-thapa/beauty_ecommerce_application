import 'dart:developer';
import 'dart:io';
import 'package:beauty_e_commerce/models/cart_model.dart';
import 'package:beauty_e_commerce/models/order_model.dart';
import 'package:beauty_e_commerce/models/order_product_model.dart';
import 'package:beauty_e_commerce/presentation/resources/routes_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../models/shipping_model.dart';
import '../models/user_model.dart';

class DataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance;
  List<UserModel> user = [];
  List<Product> specialProducts = [];
  List<Product> lipStick = [];
  List<Product> lipGloss = [];
  List<Product> eyeLiner = [];
  List<Product> mascara = [];
  List<Product> foundation = [];
  List<Product> moisturizer = [];
  List<Product> serum = [];
  List<Cart> cartProduct = [];
  List<OrderModel> orderData = [];
  List<OrderCart> orderCartProducts = [];

  bool isCart = false;

  @override
  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  submit(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on PlatformException {
      Get.snackbar('Error', "Please Check Your Internet Connection ");
    } catch (error) {
      Get.snackbar('Error', 'Incorrect Email or Password');
      return 'error';
    }
    return 'error';
  }

  Future<void> getUserProfileData() async {
    final List<UserModel> userLoaded = [];
    try {
      var response = await firebaseInstance
          .collection('User')
          .where('userId', isEqualTo: auth.currentUser!.uid)
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          userLoaded.add(UserModel(
            userEmail: result['userEmail'],
            userName: result['userName'],
            userAddress: result['userAddress'],
            userGender: result['userGender'],
          ));
        }
      }
      user.addAll(userLoaded);
      update();
    } on FirebaseException {
      // print(e);
    } catch (error) {
      // print(error);
    }
  }

  Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    log(response.toString());

    var imageUrl = await ref.getDownloadURL();
    var productId = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      FirebaseFirestore.instance.collection('Product').doc(productId).set({
        'productId': productId,
        'productName': productdata['p_name'],
        'productPrice': productdata['p_price'],
        'productDesc': productdata['p_desc'],
        'productImage': imageUrl,
        "productCategory": productdata['p_category'],
        "productVideo": productdata['p_video'],
        "special": productdata['p_special'],
        "timestamp": DateTime.now()
      });
    } catch (exception) {
      return;
    }
  }

  Future<void> addProfileImage(File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    final ref = FirebaseStorage.instance
        .ref()
        .child(auth.currentUser!.uid)
        .child(result);
    var response = await ref.putFile(image);
    log(response.toString());

    var imageUrl = await ref.getDownloadURL();

    try {
      FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser!.uid)
          .update({
        'userImage': imageUrl,
      });
    } catch (exception) {
      return;
    }
  }

  Future<void> addQuantity(Cart cartData) async {
    final auth = FirebaseAuth.instance.currentUser!.uid;

    try {
      var response = firebaseInstance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .doc(cartData.productId);

      response.update({'productQuantity': FieldValue.increment(1)});
    } catch (exception) {
      return;
    }
  }

  Future<void> subQuantity(Cart cartData) async {
    final auth = FirebaseAuth.instance.currentUser!.uid;

    try {
      var response = firebaseInstance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .doc(cartData.productId);

      response.update({'productQuantity': FieldValue.increment(-1)});
    } catch (exception) {
      return;
    }
  }

  cartTotal() {
    double total = 0.0;
    for (var element in cartProduct) {
      total += element.productPrice! * element.productQuantity!;
    }
    return total;
  }

  Future<void> deleteProduct(Cart cartData) async {
    final auth = FirebaseAuth.instance.currentUser!.uid;

    try {
      var response = firebaseInstance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .doc(cartData.productId);

      response.delete();
      cartProduct
          .removeWhere((element) => element.productId == cartData.productId);
    } catch (exception) {
      return;
    }
  }

  Future<void> addToCart(Product productdata) async {
    final auth = FirebaseAuth.instance.currentUser!.uid;
    final List<Cart> cartLodadedProduct = [];
    List<Cart> checkCartProduct = [];

    try {
      var response = FirebaseFirestore.instance
          .collection('Cart')
          .doc(auth)
          .collection('Products');

      var checkResponse = await firebaseInstance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .get();

      for (var result in checkResponse.docs) {
        cartLodadedProduct.add(
          Cart(
            productPrice: result['productPrice'],
            productId: result['productId'],
            productName: result['productName'],
            image: result['productImage'],
            productQuantity: result['productQuantity'],
          ),
        );
      }

      checkCartProduct.addAll(cartLodadedProduct);
      update();
      var contain = checkCartProduct
          .where((element) => element.productId == productdata.productId);
      if (contain.isEmpty) {
        response.doc(productdata.productId).set({
          "productName": productdata.productName,
          "productPrice": productdata.productPrice,
          "productId": productdata.productId,
          "productImage": productdata.productImage,
          "productQuantity": 1,
        });
        Get.snackbar('Alert', 'Successfully Added to Cart',
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar('Alert', 'Product Already in Cart',
            snackPosition: SnackPosition.TOP);
      }
    } catch (exception) {
      return;
    }
  }

  Future<void> placeOrder(
      List<Cart> orders, double total, Shipping shippingData) async {
    final auth = FirebaseAuth.instance.currentUser!.uid;
    try {
      var response = FirebaseFirestore.instance
          .collection('Order')
          .doc(auth)
          .collection('OrderDetails')
          .doc();

      var cartResponse = FirebaseFirestore.instance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .get();
      var responseUser = firebaseInstance.collection('User').doc(auth);
      responseUser.update({'points': FieldValue.increment(total ~/ 100)});

      response.set({
        "firstName": shippingData.firstName,
        "lastName": shippingData.lastName,
        "city": shippingData.city,
        "address": shippingData.address,
        "phoneNumber": shippingData.number,
        "totalPrice": total,
        "status": shippingData.status,
        "timestamp": DateTime.now()
      });
      for (int i = 0; i < orders.length; i++) {
        response.update({
          "Product": FieldValue.arrayUnion([
            {
              'productId': orders[i].productId,
              'productName': orders[i].productName,
              'productPrice': orders[i].productPrice,
              'productQuantity': orders[i].productQuantity,
            },
          ])
        });
      }
      cartResponse.then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
      });
      update();
    } catch (error) {
      // print("error $error");
    }
  }

  Future getOrder() async {
    orderData = [];

    try {
      final List<OrderModel> allOrders = [];
      // final List<Cart> allOrdersProducts = [];
      QuerySnapshot response = await firebaseInstance
          .collection('Order')
          .doc(auth.currentUser!.uid)
          .collection('OrderDetails')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          allOrders.add(OrderModel(
              firstName: result['firstName'],
              lastName: result['lastName'],
              city: result['city'],
              address: result['address'],
              phoneNumber: result['phoneNumber'],
              total: result['totalPrice'],
              status: result['status'],
              orders: result['Product'],
              timestamp: result['timestamp']));
        }
      }

      orderData.addAll(allOrders);
      update();
      // print(orderData[1].orders[1]);
    } on FirebaseException catch (e) {
      log("Error $e");
    } catch (error) {
      log("error $error");
    }
  }

  Future<void> getCartProduct() async {
    cartProduct = [];
    try {
      final auth = FirebaseAuth.instance.currentUser!.uid;
      final List<Cart> cartLodadedProduct = [];
      QuerySnapshot response = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(auth)
          .collection('Products')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          cartLodadedProduct.add(Cart(
            productPrice: result['productPrice'],
            productId: result['productId'],
            productName: result['productName'],
            image: result['productImage'],
            productQuantity: result['productQuantity'],
          ));
        }
      }
      // print('this $cartLodadedProduct');
      cartProduct.addAll(cartLodadedProduct);
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
    // print(cartProduct);
  }

  Future<void> getSpecialProduct() async {
    specialProducts = [];

    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('special', isEqualTo: 'special')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
              special: result['special']));
        }
      }
      specialProducts.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {
      log("Error $e");
    } catch (error) {
      log("error $error");
    }
  }

  Future<void> getLipstick() async {
    lipStick = [];

    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where("productCategory", isEqualTo: "Lipstick")
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
              special: result['special']));
        }
      }

      lipStick.addAll(lodadedProduct);
      lipStick.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException catch (e) {
      log("Error $e");
    } catch (error) {
      log("error $error");
    }
  }

  Future<void> getLipgloss() async {
    lipGloss = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Lipgloss')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          // print(result.data());
          // print("Product ID  ${result.id}");
          lodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
              special: result['special']));
        }
      }
      lipGloss.addAll(lodadedProduct);
      lipGloss.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> getEyeliner() async {
    eyeLiner = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Eyeliner')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
              productId: result['productId'],
              productName: result['productName'],
              productPrice: double.parse(result['productPrice']),
              productImage: result['productImage'],
              productCategory: result['productCategory'],
              productDesc: result['productDesc'],
              videoUrl: result['productVideo'],
              special: result['special']));
        }
      }
      eyeLiner.addAll(lodadedProduct);
      eyeLiner.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> getMascara() async {
    mascara = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Mascara')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
            productId: result['productId'],
            productName: result['productName'],
            productPrice: double.parse(result['productPrice']),
            productImage: result['productImage'],
            productCategory: result['productCategory'],
            productDesc: result['productDesc'],
            videoUrl: result['productVideo'],
            special: result['special'],
          ));
        }
      }
      mascara.addAll(lodadedProduct);
      mascara.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> getFoundation() async {
    foundation = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Foundation')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
            productId: result['productId'],
            productName: result['productName'],
            productPrice: double.parse(result['productPrice']),
            productImage: result['productImage'],
            productCategory: result['productCategory'],
            productDesc: result['productDesc'],
            videoUrl: result['productVideo'],
            special: result['special'],
          ));
        }
      }
      foundation.addAll(lodadedProduct);
      foundation.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> getMoisturizer() async {
    moisturizer = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Moisturizer')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
            productId: result['productId'],
            productName: result['productName'],
            productPrice: double.parse(result['productPrice']),
            productImage: result['productImage'],
            productCategory: result['productCategory'],
            productDesc: result['productDesc'],
            videoUrl: result['productVideo'],
            special: result['special'],
          ));
        }
      }
      moisturizer.addAll(lodadedProduct);
      moisturizer.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> getSerum() async {
    serum = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('Product')
          .where('productCategory', isEqualTo: 'Serum')
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          lodadedProduct.add(Product(
            productId: result['productId'],
            productName: result['productName'],
            productPrice: double.parse(result['productPrice']),
            productImage: result['productImage'],
            productCategory: result['productCategory'],
            productDesc: result['productDesc'],
            videoUrl: result['productVideo'],
            special: result['special'],
          ));
        }
      }
      serum.addAll(lodadedProduct);
      serum.sort((a, b) => a.productPrice.compareTo(b.productPrice));
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  Future<void> updateUser(
    String userName,
    String userEmail,
    // String userPassword,
    // String userAddress,
    // String oldPassword
  ) async {
    try {
      await firebaseInstance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "userName": userName,
        // "userAddress": userAddress,
        "userEmail": userEmail
      });
      await auth.currentUser!.updateEmail(userEmail);
      auth.signOut();
      Get.offAndToNamed(Routes.signInRoute);
      Get.snackbar('Success', 'Email Changed Successfully');
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
      log("Error $e");
    } catch (error) {
      log("error $error");
    }
  }
}
