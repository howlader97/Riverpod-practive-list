import 'package:riverpod_learn_list/favourite_app/items.dart';

class FavouriteStates {
  final List<Items> allItems;
  final List<Items> filteredItems;
  final String search;

  FavouriteStates({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });
  FavouriteStates copyWith({
    List<Items>? allItems,
    List<Items>? filteredItems,
    String? search
}){
    return FavouriteStates(
        allItems: allItems ?? this.allItems,
        filteredItems: filteredItems ?? this.filteredItems,
        search: search ?? this.search);
  }
}
