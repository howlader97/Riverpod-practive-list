import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');

  void search(String query) {
    state = query;
  }
}

class SearchState{
  final String search;

  SearchState({required this.search});
}
