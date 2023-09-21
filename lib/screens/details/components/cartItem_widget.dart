import 'package:dress_shop/screens/details/components/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_ctrl.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider).cartItems;

    if (cartItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: const Center(
          child: Text('Your cart is empty.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(cartProvider).clearCart();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];

          return ListTile(
            title: Text(cartItem.title!),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                ref.read(cartProvider).removeFromCart(cartItem.id!);
              },
            ),
            leading: Image.network(cartItem.image!),
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => DetailsScreen(
            //         product: cartItem,
            //       ),
            //     )),
          );
        },
      ),
    );
  }
}
