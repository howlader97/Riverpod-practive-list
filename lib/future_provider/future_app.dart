
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/future_provider/future_provider.dart';

class FutureApp extends ConsumerWidget {
    const FutureApp({super.key});

    @override
    Widget build(BuildContext context,WidgetRef ref) {
      final provider = ref.watch(futureProvider);
      return Scaffold(
        body: Center(child: provider.when(
            data: (value) => Text(value.toString()),
            error: (error,stack) => Text(error.toString()),
            loading: () =>const CircularProgressIndicator()),),
      );
    }
  }
