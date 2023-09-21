import 'package:dress_shop/screens/handbag/screen/handbag_page.dart';
import 'package:dress_shop/screens/shoes/screen/shoes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../dress/screen/dress_page.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  Color selectedColor = kTextLightColor;
  Widget _selectedWidget = const HandbagPage();
  var slectedText = 'hand bag';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedColor = kTextColor;
                          _selectedWidget = const HandbagPage();
                          slectedText = 'hand bag';
                        });
                      },
                      child: Text(
                        'hand bag',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: slectedText == 'hand bag'
                              ? kTextLightColor
                              : kTextColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedColor = kTextColor;
                          _selectedWidget = const Dresspage();
                          slectedText = 'dress';
                        });
                      },
                      child: Text(
                        'dress',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: slectedText == 'dress'
                              ? kTextLightColor
                              : kTextColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedColor = kTextColor;
                          _selectedWidget = const ShoesPage();
                          slectedText = 'shoes';
                        });
                      },
                      child: Text(
                        'shoes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: slectedText == 'shoes'
                              ? kTextLightColor
                              : kTextColor,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: size.height * 0.75, child: _selectedWidget),
          ],
        ),
      ),
    );
  }
}
