import 'package:flutter/material.dart';
import 'package:dress_shop/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../add_product/screen/addproduct_page.dart';
import 'categorries.dart';

class Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Row(
              children: [
                Text(
                  "Habesha styles",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: kDefaultPaddin * 7),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProductPage(),
                        )),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          Categories(),
        ],
      ),
    );
  }
}
