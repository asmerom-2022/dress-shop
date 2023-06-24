import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_ctrl.dart';
import 'details_screen.dart';

class FavScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(favoriteProvider).cartItems;

    if (cartItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: const Center(
          child: Text('Your favorite is empty.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(favoriteProvider).clearCart();
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
            subtitle: Text(cartItem.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.heart_broken_sharp),
              onPressed: () {
                ref.read(cartProvider).removeFromCart(cartItem.id!);
              },
            ),
            leading: Image.network(cartItem.image!),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    product: cartItem,
                  ),
                )),
          );
        },
      ),
    );
  }
}
