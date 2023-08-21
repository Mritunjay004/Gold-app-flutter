import 'package:first_app/data/dummy_data.dart';
import 'package:first_app/models/item.dart';
import 'package:first_app/screens/categories.dart';
import 'package:first_app/screens/filters.dart';
import 'package:first_app/screens/items.dart';
import 'package:first_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilters = {
  Filter.certified: false,
  Filter.hallmarked: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _seletedPageIndex = 0;
  final List<GoldItem> _favoriteItems = [];
  Map<Filter, bool> _selectedfilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _toggleGoldItemStatus(GoldItem item) {
    final isExisting = _favoriteItems.contains(item);

    if (isExisting) {
      setState(() {
        _favoriteItems.remove(item);
      });
      _showInfoMessage('Removed from favorites!');
    } else {
      setState(() {
        _favoriteItems.add(item);
      });
      _showInfoMessage('Added to favorites!');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _seletedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedfilters,
          ),
        ),
      );

      setState(() {
        _selectedfilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableItems = dummyGoldItems.where((item) {
      if (_selectedfilters[Filter.certified]! && !item.isCertified) {
        return false;
      }

      if (_selectedfilters[Filter.hallmarked]! && !item.isHallmarked) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleGoldItemStatus,
      availableItems: availableItems,
    );
    var activePageTitle = 'Categories';

    if (_seletedPageIndex == 1) {
      activePage = GoldItemsScreen(
          items: _favoriteItems, onToggleFavorite: _toggleGoldItemStatus);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _seletedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: (Icon(Icons.category)), label: 'Categories'),
          BottomNavigationBarItem(icon: (Icon(Icons.star)), label: 'Favorites'),
        ],
      ),
    );
  }
}
