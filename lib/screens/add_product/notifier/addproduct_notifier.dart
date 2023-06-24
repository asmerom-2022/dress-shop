import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_dashboard/features/notifications/notification_message.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';

class UploadNotifier extends AutoDisposeNotifier<Product> {
  @override
  build() {
    // ref.onDispose(() {

    // })
    return Product();
  }

  Future<bool> uploadImage(
      BuildContext context,
      String? name,
      String? price,
      File? imageFile,
      String description,
      String size,
      String category,
      String quantity) async {
    // Notificationmsg notifmsg = Notificationmsg();
    String? imageUrl;
    final FirebaseStorage storage = FirebaseStorage.instance;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}';
    final Reference ref = storage.ref().child('images/$fileName');
    final UploadTask uploadTask = ref.putFile(imageFile!);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {
      // notifmsg.showNotification('product', name!);
      log('Successfull');
    });

    imageUrl = await snapshot.ref.getDownloadURL();

    final DocumentReference<Map<String, dynamic>> images =
        FirebaseFirestore.instance.collection(category).doc(fileName);

    final prodcuts = Product(
      title: name,
      price: int.parse(price!),
      image: imageUrl,
      id: int.parse(fileName),
      description: description,
      size: int.parse(size),
      quantity: int.parse(quantity),
    );

    try {
      final json = prodcuts.toMap();
      await images.set(json);
      log('uploaded successfull');

      return true;
    } catch (e) {
      log('error: ${e.toString}');
      return false;
    }
  }

  void disposeUploadedData() {}
}
