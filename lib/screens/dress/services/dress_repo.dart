import 'package:dress_shop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class dressRepo {
  Stream<List<Product>> watchDressList() {
    try {
      final data =
          FirebaseFirestore.instance.collection('dress').snapshots().map(
                (snapshot) => snapshot.docs
                    .map(
                      (doc) => Product.fromMap(doc.data()),
                    )
                    .toList(),
              );
      return data;
    } catch (e) {
      throw ('Something went wrong on:dressrepo  function:read dress function.... $e');
    }
  }
}

final dressRepoProvider = Provider<dressRepo>((ref) {
  return dressRepo();
});
