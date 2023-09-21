import 'package:flutter/material.dart';
import 'package:dress_shop/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
                // SizedBox(width: _getContainerWidth(context)),
                Spacer(),
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

  double _getContainerWidth(BuildContext context) {
    if (kIsWeb) {
      // Adjust width for web platform
      return MediaQuery.of(context).size.width * 0.7;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Adjust width for iOS platform
      return 200.0;
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      // Adjust width for iOS platform
      return MediaQuery.of(context).size.width * 0.35;
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
