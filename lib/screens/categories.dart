import 'package:first_app/data/dummy_data.dart';
import 'package:first_app/models/category.dart';
import 'package:first_app/models/item.dart';
import 'package:first_app/screens/items.dart';
import 'package:first_app/widgets/categories_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableItems});

  final void Function(GoldItem item) onToggleFavorite;
  final List<GoldItem> availableItems;

  void _selectCategory(BuildContext context, Category category) {
    final filterItems = availableItems
        .where((item) => item.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => GoldItemsScreen(
          title: category.title,
          items: filterItems,
          onToggleFavorite: onToggleFavorite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
