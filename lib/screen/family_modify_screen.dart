import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/model/family_modifier_provider.dart';

class FamilyModifyScreen extends ConsumerWidget {
  const FamilyModifyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifyProvider(3));
    return DefaultLayout(title: "FamilyModifierScreen", body: Center(
      child: 
        state.when (data: (data) => Text(data.toString()),
        error: (error, stackTrace) => Text("Error occurred: $error"),
        loading: () => CircularProgressIndicator(),
        ),
      
    ),);
  }
}