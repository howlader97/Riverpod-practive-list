import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider= FutureProvider<List<String>>((ref)async{
  await Future.delayed(const Duration(seconds: 4));
  return ['Remon','Robiul','tark','mak'];
});
