import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/todo_app/item_provider.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      body: item.isEmpty
          ? Center(child: Text("no data"))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final itemDetails = item[index];
                return ListTile(
                  title: Text(itemDetails.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .updateItem(itemDetails.id, 'update name remon');
                        },
                        icon: Icon(Icons.edit, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .deleteItem(itemDetails.id);
                        },
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('Remon');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
