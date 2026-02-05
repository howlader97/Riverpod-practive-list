import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/get_data/post_provider.dart';

class DataGetApp extends ConsumerWidget {
  const DataGetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final getData = ref.watch(postProvider);
          return Center(
            child: getData.when(
              data: (value) => ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final data = value[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id    : ${data.id}'),
                          Text('UserId: ${data.userId}'),
                          Text('Title : ${data.title}'),
                          Text('body  : ${data.body}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
              error: (error, stack) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
