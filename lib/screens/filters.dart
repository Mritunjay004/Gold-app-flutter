import 'package:flutter/material.dart';

enum Filter {
  certified,
  hallmarked,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _certifiedFilterSet = false;
  var _hallmarkedFilterSet = false;

  @override
  void initState() {
    super.initState();
    _certifiedFilterSet = widget.currentFilters[Filter.certified]!;
    _hallmarkedFilterSet = widget.currentFilters[Filter.hallmarked]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.certified: _certifiedFilterSet,
            Filter.hallmarked: _hallmarkedFilterSet,
          });

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _certifiedFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _certifiedFilterSet = isChecked;
                });
              },
              title: Text(
                'Certified Gold',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include certified gold items.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _hallmarkedFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _hallmarkedFilterSet = isChecked;
                });
              },
              title: Text(
                'Hallmarked Gold',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include hallmarked gold items.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
