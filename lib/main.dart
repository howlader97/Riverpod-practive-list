import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_list/favourite_app/favourite_app.dart';
import 'package:riverpod_learn_list/todo_app/todo_app.dart';
import 'future_provider/future_app.dart';



void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: FutureApp(),
       // home: FavouriteApp(),
      ),
    );
  }
}
