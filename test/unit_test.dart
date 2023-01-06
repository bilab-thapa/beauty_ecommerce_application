import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

const productName = 'TestProduct';
const productPrice = '1000.0';
const productId = 'randomId';
const productImage = 'dummyImageInNetwork';
const productQuantity = '1';

Future<void> main() async {
  group('Unit Pass', () {
    test('SignUp', () async {
      String? response;
      final auth = MockFirebaseAuth();
      auth.createUserWithEmailAndPassword(
          email: 'b@b.com', password: 'bilab123');
      final firestore = FakeFirebaseFirestore();
      try {
        await firestore.collection("User").add({
          'email': 'b@b.com',
          'password': 'bilab123',
        });
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });
    test('SignIn', () async {
      final auth = MockFirebaseAuth();
      String? response;
      try {
        auth.signInWithEmailAndPassword(email: 'b@b.com', password: 'bilab123');
        response = 'success';
      } on PlatformException {
        response = 'platform error';
      } catch (error) {
        response = 'error';
      }
      expect(response, 'success');
    });

    test('SignOut', () async {
      final auth = MockFirebaseAuth();
      auth.signOut();
    });
    test('Add to Cart', () async {
      String? response;
      final firestore = FakeFirebaseFirestore();
      try {
        await firestore.collection("Cart").doc(productId).set({
          "productName": productName,
          "productPrice": productPrice,
          "productId": productId,
          "productImage": productImage,
          "productQuantity": productQuantity,
        });
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });

    test('Get Cart', () async {
      String? response;
      final firestore = FakeFirebaseFirestore();

      try {
        await firestore.collection("Cart").doc().get();
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });
  });
  group('Unit Fail', () {
    test('SignUp', () async {
      String? response;
      final auth = MockFirebaseAuth();
      auth.createUserWithEmailAndPassword(email: 'b@b.com', password: 'as');
      final firestore = FakeFirebaseFirestore();
      try {
        await firestore.collection("User").add({
          'email': 'b@b.com',
          'password': 'bilab123',
        });
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });
    test('SignIn', () async {
      final auth = MockFirebaseAuth();
      String? response;
      try {
        auth.signInWithEmailAndPassword(email: 'b@b.com', password: 'bilab123');
        response = 'success';
      } on PlatformException {
        response = 'platform error';
      } catch (error) {
        response = 'error';
      }
      expect(response, 'success');
    });

    test('SignOut', () async {
      final auth = MockFirebaseAuth();
      auth.signOut();
    });
    test('Add to Cart', () async {
      String? response;
      final firestore = FakeFirebaseFirestore();
      try {
        await firestore.collection("Cart").doc(productId).set({
          "productName": productName,
          "productPrice": productPrice,
          "productId": productId,
          "productImage": productImage,
          "productQuantity": productQuantity,
        });
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });

    test('Get Cart', () async {
      String? response;
      final firestore = FakeFirebaseFirestore();

      try {
        await firestore.collection("Cart").doc().get();
        response = 'success';
      } catch (e) {
        response = 'error';
      }
      expect(response, 'success');
    });
  });
}
