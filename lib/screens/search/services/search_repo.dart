import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/product.dart';

class ContentService {
  final CollectionReference _dressCollection =
      FirebaseFirestore.instance.collection('dress');
  final CollectionReference _handbagCollection =
      FirebaseFirestore.instance.collection('handbag');
  final CollectionReference _shoesCollection =
      FirebaseFirestore.instance.collection('shoes');

  Future<List<Product>> searchContent(String query) async {
    final QuerySnapshot snapshotDress = await _dressCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: query + 'z')
        .get();
    final QuerySnapshot snapshotHandbag = await _handbagCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: query + 'z')
        .get();
    final QuerySnapshot snapshotShoes = await _shoesCollection
        .where('title', isGreaterThanOrEqualTo: query)
        .where('title', isLessThan: query + 'z')
        .get();

    final List<Product> results = [];
    snapshotDress.docs.forEach((doc) {
      final content = Product(
        title: doc['title'],
        image: doc['images'],
        description: doc['description'],
        price: doc['price'],
        size: doc['size'],
      );
      results.add(content);
    });

    snapshotHandbag.docs.forEach((doc) {
      final content = Product(
        title: doc['title'],
        image: doc['images'],
        description: doc['description'],
        price: doc['price'],
        size: doc['size'],
      );
      results.add(content);
    });
    snapshotShoes.docs.forEach((doc) {
      final content = Product(
        title: doc['title'],
        image: doc['images'],
        description: doc['description'],
        price: doc['price'],
        size: doc['size'],
      );
      results.add(content);
    });

    return results;
  }
}
