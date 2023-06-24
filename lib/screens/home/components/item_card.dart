import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/product.dart';

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function()? press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product!.id}",
                child: Image.network(product!.image!, fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPaddin / 4, horizontal: kDefaultPaddin),
            child: Text(
              product!.title!,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kDefaultPaddin / 4, horizontal: kDefaultPaddin),
            child: Text(
              "\$${product!.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
