import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_shop/screens/details/components/controller.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';

import 'constants.dart';

UsePaypal paymentprocess(
    double prices, int quantity, String name, String currency) {
  final PaymentController _paymentController =
      Get.put(PaymentController()); // Initialize the controller
  final String price = prices.toString();
  print('amount is in paypal $price');
  print('quantity is in paypal $quantity');

  /// TODO: when quantity is more than one makes eroor
  /// fix this error
  return UsePaypal(
      sandboxMode: true,
      clientId: "${Constants.clientId}",
      secretKey: "${Constants.secretKey}",
      returnURL: "${Constants.returnURL}",
      cancelURL: "${Constants.cancelURL}",
      transactions: [
        {
          "amount": {
            "total": price,
            "currency": currency,
            "details": {
              "subtotal": price,
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": [
              {
                "name": name,
                "quantity": quantity,
                "price": price,
                "currency": currency
              }
            ],

            // shipping address is not required though
            "shipping_address": {
              "recipient_name": "Jane Foster",
              "line1": "Travis County",
              "line2": "",
              "city": "Austin",
              "country_code": "US",
              "postal_code": "73301",
              "phone": "+00000000",
              "state": "Texas"
            },
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        saveUserInfo(price, currency, name, quantity);
        _paymentController.updatePaymentStatus(true);
        //NavigationService.navigateToSuccessScreen();
      },
      onError: (error) {
        log("onError: $error");
      },
      onCancel: (params) {
        log('cancelled: $params');
      });
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> saveUserInfo(
    String amount, String currency, String product, int quantity) async {
  try {
    // final String total = amount * quantity;
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
