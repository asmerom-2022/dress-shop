import 'package:get/get.dart';

class PaymentController extends GetxController {
  var isPaymentSuccess = false.obs; // Observable variable

  // Method to update the payment success status
  void updatePaymentStatus(bool isSuccess) {
    isPaymentSuccess.value = isSuccess;
  }
}
