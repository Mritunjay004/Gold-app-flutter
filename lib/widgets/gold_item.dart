import 'package:first_app/models/item.dart';
import 'package:first_app/widgets/gold_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.goldItem,
    required this.onSelectGoldItem,
  });

  final GoldItem goldItem;
  final void Function(GoldItem goldItem) onSelectGoldItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectGoldItem(goldItem);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(goldItem.imageURL),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(children: [
                  Text(
                    goldItem.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GoldItemTrait(
                          icon: Icons.attach_money, label: '${goldItem.price}'),
                      const SizedBox(width: 12),
                      GoldItemTrait(
                          label: '${goldItem.purity}', icon: Icons.star_border),
                      const SizedBox(width: 12),
                      GoldItemTrait(
                          label: '${goldItem.weight}', icon: Icons.line_weight),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
