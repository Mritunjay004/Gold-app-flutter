import 'package:first_app/models/item.dart';
import 'package:first_app/screens/item_details.dart';
import 'package:first_app/widgets/gold_item.dart';
import 'package:flutter/material.dart';

class GoldItemsScreen extends StatelessWidget {
  const GoldItemsScreen(
      {super.key,
      this.title,
      required this.items,
      required this.onToggleFavorite});

  final String? title;
  final List<GoldItem> items;
  final void Function(GoldItem item) onToggleFavorite;

  void selectGoldItem(GoldItem goldItem, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => GoldItemScreen(
        goldItem: goldItem,
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => CategoryItem(
              goldItem: items[index],
              onSelectGoldItem: (goldItem) {
                selectGoldItem(goldItem, context);
              },
            ));

    if (items.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
