import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class AdminController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebaseInstance = FirebaseFirestore.instance;
  List<UserModel> user = [];
  List<OrderModel> orderData = [];
  List<Product> allProducts = [];
  List<UserModel> maleUser = [];
  List<UserModel> femaleUser = [];
  List uid = [];
  num totalPrice = 0;

  // @override
  // void onInit() {
  //   super.onInit();
  //   allUser();
  //   // getAllProduct();
  //   // getOrder();
  // }

  void getAllId() async {
    uid = [];

    await firebaseInstance.collection('User').get().then((value) {
      for (var element in value.docs) {
        uid.add(element.id);
      }
      update();
    });
  }

  Future<void> getAllProduct() async {
    allProducts = [];

    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance.collection('Product').get();

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
      allProducts.addAll(lodadedProduct);
      update();
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }

  void deleteProduct(String id) async {
    try {
      await firebaseInstance.collection('Product').doc(id).delete();
    } on FirebaseException {
      // print(e);
    } catch (error) {
      // print(error);
    }
  }

  void allUser() async {
    user = [];
    try {
      var response = await firebaseInstance
          .collection('User')
          .where('role', isEqualTo: 'user')
          .get();
      var responseMale = await firebaseInstance
          .collection('User')
          .where('userGender', isEqualTo: 'Male')
          .where('role', isEqualTo: 'user')
          .get();
      var responseFemale = await firebaseInstance
          .collection('User')
          .where('userGender', isEqualTo: 'Female')
          .where('role', isEqualTo: 'user')
          .get();

      // print(response.docs.length);
      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          user.add(UserModel(
            userImage: result['userImage'],
            userEmail: result['userEmail'],
            userName: result['userName'],
            userAddress: result['userAddress'],
            userGender: result['userGender'],
          ));
        }
      }
      if (responseMale.docs.isNotEmpty) {
        for (var result in responseMale.docs) {
          maleUser.add(UserModel(
            userImage: result['userImage'],
            userEmail: result['userEmail'],
            userName: result['userName'],
            userAddress: result['userAddress'],
            userGender: result['userGender'],
          ));
        }
      }
      if (responseFemale.docs.isNotEmpty) {
        for (var result in responseFemale.docs) {
          femaleUser.add(UserModel(
            userImage: result['userImage'],
            userEmail: result['userEmail'],
            userName: result['userName'],
            userAddress: result['userAddress'],
            userGender: result['userGender'],
          ));
        }
      }

      update();
    } on FirebaseException {
      // print(e);
    } catch (error) {
      // print(error);
    }
  }

  void getOrder() async {
    orderData = [];

    try {
      final List<OrderModel> allOrders = [];
      var response =
          await firebaseInstance.collectionGroup('OrderDetails').get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          allOrders.add(OrderModel(
              firstName: result['firstName'],
              lastName: result['lastName'],
              city: result['city'],
              address: result['address'],
              phoneNumber: result['phoneNumber'],
              total: result['totalPrice'],
              orders: result['Product'],
              status: result['status'],
              timestamp: result['timestamp']));
        }
      }
      totalPrice = 0;
      for (var result in response.docs) {
        totalPrice = totalPrice + result['totalPrice'];
      }
      orderData.addAll(allOrders);
      orderData.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      update();

      // print(orderData);
    } on FirebaseException {
      // print("Error $e");
    } catch (error) {
      // print("error $error");
    }
  }
}
