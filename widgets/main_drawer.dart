import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ])),
            child: Row(
              children: [
                Icon(
                  Icons.restaurant,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Let\'s Cook!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                    ),),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter),
            title: Text('Filter',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                    )),
            onTap: () {
              onSelectScreen('filter');
            },
          ),
        ],
      ),
    );
  }
}
