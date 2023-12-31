import 'dart:developer';

import 'package:dress_shop/screens/details/components/controller.dart';
import 'package:dress_shop/screens/details/components/stripe_payment/payment_manager.dart';
import 'package:dress_shop/screens/details/components/stripe_payment/paypalpayment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../models/cart.dart';
import '../../../models/product.dart';
import 'cart_ctrl.dart';

class AddToCart extends ConsumerStatefulWidget {
  final Product product;
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final PaymentController _paymentController = Get.put(PaymentController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        children: [
          cartCounter(context),
          const SizedBox(height: kDefaultPaddin / 2),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: kDefaultPaddin),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(),
                ),
                child: IconButton(
                  icon: Icon(Icons.add_shopping_cart_sharp),
                  onPressed: () {
                    final cartProviders = ref.read(cartProvider);

                    cartProviders.addToCart(
                      CartItem(
                          id: widget.product.id,
                          title: widget.product.title,
                          price: widget.product.price,
                          quantity: numOfItems,
                          image: widget.product.image),
                      numOfItems,
                    );
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showCustomSnackbar(context);
                      // if (_paymentController.isPaymentSuccess == true) {
                      //   showSnackbar(context);
                      // }
                    },
                    child: Text(
                      "Buy  Now".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // for cart counter
  Row cartCounter(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
        const SizedBox(
          width: 200,
        ),
        Container(
          // padding: EdgeInsets.all(8),
          height: 38,
          width: 38,
          decoration: const BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.favorite_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              final favProviders = ref.read(favoriteProvider);

              favProviders.addToCart(
                Product(
                  id: widget.product.id,
                  title: widget.product.title,
                  price: widget.product.price,
                  image: widget.product.image,
                  description: widget.product.description,
                  // quantity: numOfItems,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  SizedBox buildOutlineButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgscaffold,
        showCloseIcon: true,
        content: Column(
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  final int amount = widget.product.price!;
                  final int quantity = numOfItems;
                  final String name = widget.product.title!;
                  final String currency = 'USD';
                  final int price = amount * quantity;
                  PaymentManager.makePayment(price, currency, name, quantity);
                },
                child: Text(
                  'Stripe payment',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 16),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  final double price = widget.product.price!.toDouble();
                  final int quantity = numOfItems;
                  final String name = widget.product.title!;
                  final String currency = 'USD';
                  final double amount = price * quantity;
                  print('amount is $amount');
                  print('quantity is $quantity');
                  // using this for paypal process
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          paymentprocess(amount, quantity, name, currency),
                    ),
                  );
                },
                child: Text(
                  'paypal payment',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}

void showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('you paid succeefully. Thank you'),
      action: SnackBarAction(
        label: 'Yes',
        onPressed: () {
          // Navigate to the first screen when the "Yes" button is pressed
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
