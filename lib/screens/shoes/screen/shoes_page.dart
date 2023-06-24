import 'package:dress_shop/screens/shoes/controller/shoes_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/constants.dart';
import '../../../constants/error.dart';
import '../../details/components/details_screen.dart';
import '../../home/components/item_card.dart';

class ShoesPage extends ConsumerWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoes = ref.watch(shoesprovider);
    return shoes.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                    product: data[index]!,
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: data[index],
                          ),
                        )),
                  )),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return AdminErrorWidget(message: error.toString());
      },
      loading: () {
        return const LoadingWidget();
      },
    );
  }
}
