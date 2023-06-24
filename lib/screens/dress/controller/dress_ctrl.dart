import 'package:dress_shop/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/dress_repo.dart';

class DressCtrl {
  DressCtrl({required this.ref});
  final Ref ref;

  Stream<List<Product>> DressList() {
    try {
      return ref.read(dressRepoProvider).watchDressList();
    } catch (e) {
      throw ('Something went wrong here....');
    }
  }
}

final DresscontrollerProvider = Provider<DressCtrl>((ref) {
  return DressCtrl(ref: ref);
});
final Dressprovider = StreamProvider<List<Product>>((ref) {
  return ref.read(DresscontrollerProvider).DressList();
});
