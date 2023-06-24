import 'package:dress_shop/models/product.dart';
import 'package:dress_shop/screens/shoes/services/shoes_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DressCtrl {
  DressCtrl({required this.ref});
  final Ref ref;

  Stream<List<Product>> ShoesList() {
    try {
      return ref.read(shoesRepoProvider).watchShoesList();
    } catch (e) {
      throw ('Something went wrong here....');
    }
  }
}

final shoescontrollerProvider = Provider<DressCtrl>((ref) {
  return DressCtrl(ref: ref);
});
final shoesprovider = StreamProvider<List<Product>>((ref) {
  return ref.read(shoescontrollerProvider).ShoesList();
});
