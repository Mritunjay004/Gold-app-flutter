class GoldItem {
  const GoldItem({
    required this.id,
    required this.categories,
    required this.name,
    required this.imageURL,
    required this.description,
    required this.rarity,
    required this.price,
    required this.weight,
    required this.purity,
    required this.isCertified,
    required this.isHallmarked,
  });

  final String id;
  final List<String> categories;
  final String name;
  final String imageURL;
  final String description;
  final String rarity;
  final double price;
  final double weight;
  final double purity;
  final bool isCertified;
  final bool isHallmarked;
}
