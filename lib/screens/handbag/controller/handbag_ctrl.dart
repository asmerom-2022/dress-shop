import 'package:dress_shop/models/product.dart';
import 'package:dress_shop/screens/handbag/services/handbag_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HandbagCtrl {
  HandbagCtrl({required this.ref});
  final Ref ref;

  Stream<List<Product>> HandbagList() {
    try {
      return ref.read(handbagRepoProvider).watchHandbagList();
    } catch (e) {
      throw ('Something went wrong here....');
    }
  }
}

final handbagcontrollerProvider = Provider<HandbagCtrl>((ref) {
  return HandbagCtrl(ref: ref);
});
final handbagprovider = StreamProvider<List<Product>>((ref) {
  return ref.read(handbagcontrollerProvider).HandbagList();
});
