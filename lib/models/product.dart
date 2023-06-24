import 'dart:convert';
import 'dart:ui';

class Product {
  final String? image, title, description;
  int? price, size, id, quantity;

  Product(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      this.quantity});

  Product copyWith({
    final String? image,
    title,
    description,
    final int? price,
    size,
    id,
    final int? quantity,
  }) {
    return Product(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      size: size ?? this.size,
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'images': image,
      'price': price,
      'size': size,
      'id': id,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['images'] as String,
      price: map['price'] as int,
      size: map['size'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
    return other.title == title &&
        other.description == description &&
        other.image == image &&
        other.size == size &&
        other.price == price &&
        other.quantity == quantity &&
        other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        price.hashCode ^
        size.hashCode ^
        quantity.hashCode;
  }
}
