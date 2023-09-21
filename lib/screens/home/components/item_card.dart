import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

  double _getContainerWidth(BuildContext context) {
    if (kIsWeb) {
      // Adjust width for web platform
      return MediaQuery.of(context).size.width * 0.1;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Adjust width for iOS platform
      return 200.0;
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      // Adjust width for iOS platform
      return MediaQuery.of(context).size.width * 0.01;
    } else {
      // Default width for other platforms
      return 300.0;
    }
  }

  double _getContainerHeight(BuildContext context) {
    if (kIsWeb) {
      // Adjust height for web platform
      return MediaQuery.of(context).size.height * 0.3;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Adjust height for iOS platform
      return 150.0;
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      // Adjust width for iOS platform
      return 200.0;
    } else {
      // Default height for other platforms
      return 200.0;
    }
  }
}
