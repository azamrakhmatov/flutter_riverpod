import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeModifierScreen = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return [10, 20, 30, 40, 50];
});