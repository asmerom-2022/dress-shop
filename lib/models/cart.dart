// class CartItem {
//   final String? id;
//   final String? name;
//   final double? price;
//   final int? quantity;

//   CartItem({this.id, this.name, this.price, this.quantity});
// }

import 'package:hive/hive.dart';

class CartItem {
  final String? image, title, description;
  final int? price, size, id;
  int quantity;

  CartItem(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      required this.quantity});
}
