import 'package:flutter/material.dart';
import 'package:dress_shop/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';
import 'add_to_cart.dart';
import 'cart_counter.dart';
import 'color_and_size.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Detailbody extends ConsumerWidget {
  final Product? product;

  const Detailbody({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product!),
                      const SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product!),
                      const SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product!)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
