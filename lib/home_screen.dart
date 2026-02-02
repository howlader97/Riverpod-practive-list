import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_learn_list/search_provider.dart';
import 'package:riverpod_learn_list/slide_provider.dart';

final demo = Provider<String>((r) {
  return 'Thank you';
});
final demo1 = Provider<int>((re) {
  return 55;
});

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final result = ref.watch(demo);
    final result1 = ref.watch(demo1);

    print("HomeScreen build");

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                return Text(count.toString(), style: TextStyle(fontSize: 22));
              },
            ),
            Text(result + " " + result1.toString(),
              style: TextStyle(fontSize: 22),
            ),
            Consumer(builder: (context,re,child){
              print("consumer build");
              final slide=ref.watch(slideProvider);
              return Container(
                width: 200,
                height: 200,
                color: Colors.red.withAlpha((slide * 255).toInt()),
              );
            }),
          Consumer(builder: (context,ref,child){
            final slide=ref.watch(slideProvider);
            return Slider(value: slide, onChanged: (value){
              ref.read(slideProvider.notifier).state = value;
            });
          }),
            TextField(
              onChanged: (value){
                ref.read(searchProvider.notifier).search(value);
            }
            ),
            Consumer(builder: (context,ref,child){
              final search=ref.watch(searchProvider);
              return Text(search.search);
            }),
            Consumer(builder: (context,ref,child){
              final search=ref.watch(searchProvider);
              return Switch(value: search.isChange, onChanged: (value){
                ref.read(searchProvider.notifier).onChange(value);
              });
            })

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
