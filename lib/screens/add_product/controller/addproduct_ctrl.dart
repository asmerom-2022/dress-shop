import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';
import '../notifier/addproduct_notifier.dart';

final uploadInfoProvider =
    NotifierProvider.autoDispose<UploadNotifier, Product>(UploadNotifier.new);

final uploadStatusProvider = FutureProvider.autoDispose((ref) async {
  ref.watch(uploadInfoProvider);
});
