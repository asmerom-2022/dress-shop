import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dress_shop/screens/details/components/controller.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class PaymentManager {
  static Future<void> makePayment(
      int amount, String currency, String product, int quantity) async {
    try {
      final PaymentController _paymentController =
          Get.put(PaymentController()); // Initialize the controller
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      saveUserInfo(amount.toDouble(), currency, product, quantity);
      _paymentController.updatePaymentStatus(true);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization':
              'Bearer sk_test_51NjHAUCBxEywMsKlByP6wkiNDeLE8FDg6ZUp5garmRuPEB8q6rkmAVyefHfePtICC6mlZPqAgI90JlbUev6ffsAp00xUD21IJq',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    log('testing..');
    return response.data["client_secret"];
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> saveUserInfo(
    double amount, String currency, String product, int quantity) async {
  try {
    await _firestore.collection('payment').add({
      'quantity': quantity,
      'product': product,
      'amount': amount,
      'currency': currency,
      'total_price': amount
      // Add more user data as needed
    });
    print('User information saved to Firestore');
  } catch (error) {
    print('Error saving user information: $error');
  }
}
