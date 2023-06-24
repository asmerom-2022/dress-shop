import 'package:dress_shop/models/product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoesRepo {
  // final Ref ref;

  Stream<List<Product>> watchShoesList() {
    try {
      final data =
          FirebaseFirestore.instance.collection('shoes').snapshots().map(
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

final shoesRepoProvider = Provider<ShoesRepo>((ref) {
  return ShoesRepo();
});
