import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/stream_provider/stream_provider.dart';

class StreamApp extends ConsumerWidget {
  const StreamApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print('build');
    return Scaffold(
      body: Consumer(builder: (context,ref,child){
        final data = ref.watch(priceProvider);
        return Center(
          child: data.when(
            data: (price) => Text(
              price.toStringAsFixed(2).toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            error: (error, stack) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        );
      })
    );
  }
}
