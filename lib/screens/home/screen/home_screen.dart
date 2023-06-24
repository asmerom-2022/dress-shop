import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dress_shop/constants/constants.dart';
import 'package:dress_shop/screens/home/components/homebody.dart';

import '../../details/components/cartItem_widget.dart';
import '../../search/screen/search.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 54, 50, 50),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
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
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              )),
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              )),
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
