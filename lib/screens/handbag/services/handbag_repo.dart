import 'package:dress_shop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HandbagRepo {
  Stream<List<Product>> watchHandbagList() {
    try {
      final data =
          FirebaseFirestore.instance.collection('handbag').snapshots().map(
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

final handbagRepoProvider = Provider<HandbagRepo>((ref) {
  return HandbagRepo();
});
