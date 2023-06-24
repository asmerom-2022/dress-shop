import 'package:dress_shop/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/cart.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item, int numOfItems) {
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.id == item.id,
    );

    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity += numOfItems;
    } else {
      _cartItems.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

final cartProvider =
    ChangeNotifierProvider<CartProvider>((ref) => CartProvider());

/// favorie provider

class FavoriteProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product item) {
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.id == item.id,
    );

    if (existingIndex != -1) {
    } else {
      _cartItems.add(item);
    }

    notifyListeners();
  }

  void removeFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

final favoriteProvider =
    ChangeNotifierProvider<FavoriteProvider>((ref) => FavoriteProvider());
