import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/future_provider/future_provider.dart';
import '../favourite_app/favourite_provider.dart';

class FutureApp extends ConsumerWidget {
  const FutureApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Text(value[index].toString());
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
