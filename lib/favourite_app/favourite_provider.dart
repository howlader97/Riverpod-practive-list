import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_learn_list/favourite_app/favourite_states.dart';
import 'package:riverpod_learn_list/favourite_app/items.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteStates>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteStates> {
  FavouriteNotifier()
      : super(
    FavouriteStates(
      allItems: [],
      filteredItems: [],
      search: '',
    ),
  );

  // 1️⃣ Add items
  void addItem() {
    final items = [
      Items(id: 1, name: 'Macbook', favourite: true),
      Items(id: 2, name: 'Apple', favourite: true),
      Items(id: 3, name: 'Windows', favourite: false),
      Items(id: 4, name: 'Samsung', favourite: true),
      Items(id: 5, name: 'Google pixel', favourite: false),
      Items(id: 6, name: 'Nokia', favourite: true),
      Items(id: 7, name: 'Linux', favourite: false),
    ];

    state = state.copyWith(
      allItems: items,
      filteredItems: items,
    );
  }

  // 2️⃣ Filter list (SEARCH)
  void filterList(String search) {
    state = state.copyWith(
      search: search,
      filteredItems: _filterItems(state.allItems, search),
    );
  }

  // 3️⃣ Helper method
  List<Items> _filterItems(List<Items> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items
        .where(
          (item) =>
          item.name.toLowerCase().contains(search.toLowerCase()),
    )
        .toList();
  }
}

