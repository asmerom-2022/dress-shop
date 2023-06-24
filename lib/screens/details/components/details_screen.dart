import 'package:flutter/material.dart';
import 'package:dress_shop/constants/constants.dart';
import 'package:dress_shop/screens/details/components/detailbody.dart';

import '../../../models/product.dart';
import '../../search/screen/search.dart';
import 'cartItem_widget.dart';
import 'favorite_widget.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgColor.withOpacity(.95),
      appBar: buildAppBar(context),
      body: Detailbody(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white60,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              )),
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white60,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              )),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white60,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavScreen(),
              )),
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
