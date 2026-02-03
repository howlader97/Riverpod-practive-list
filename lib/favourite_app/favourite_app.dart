import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/favourite_app/favourite_provider.dart';

class FavouriteApp extends ConsumerWidget {
  const FavouriteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).filterList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(
                    item.favourite ? Icons.favorite : Icons.favorite_border,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
