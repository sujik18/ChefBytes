// import 'package:chef_bytes/screens/tabs.dart';
// import 'package:chef_bytes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.onSaveFilters});
  final void Function(Map<String, bool> filters) onSaveFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _sugarFreeFilterSet = false;
  var _maidaFreeFilterSet = false;
  var _pureVegFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              widget.onSaveFilters({});
            },
          ),
        ],
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     switch (identifier) {
      //       case 'meals':
      //         Navigator.of(context).pushReplacement( //back btn will not work
      //           MaterialPageRoute(
      //             builder: (ctx) =>
      //                 const TabsScreen(),
      //           ),
      //         );
      //         break;
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: _sugarFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _sugarFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Sugar-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include sugar-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 22),
          ),
          SwitchListTile(
            value: _maidaFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _maidaFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Maida-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include meals with 0% maida',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 22),
          ),
          SwitchListTile(
            value: _pureVegFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _pureVegFilterSet = isChecked;
              });
            },
            title: Text(
              'Pure-Veg',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegterain meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 20, right: 22),
          )
        ],
      ),
    );
  }
}
