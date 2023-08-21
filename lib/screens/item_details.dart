import 'package:first_app/models/item.dart';
import 'package:flutter/material.dart';

class GoldItemScreen extends StatelessWidget {
  const GoldItemScreen({
    super.key,
    required this.goldItem,
    required this.onToggleFavorite,
  });

  final GoldItem goldItem;
  final void Function(GoldItem item) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(goldItem.name),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(goldItem);
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            goldItem.imageURL,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Description',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            goldItem.description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Other Details',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Rarity: ${goldItem.rarity}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'Certified: ${goldItem.isCertified ? 'Yes' : 'No'}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'Hallmarked: ${goldItem.isHallmarked ? 'Yes' : 'No'}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            'Purity: ${goldItem.purity}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
  }
}
