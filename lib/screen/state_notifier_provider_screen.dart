import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/model/shopping_item_model.dart';
import 'package:getx_app/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 👇 shopping list holatini kuzatish
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: "Shopping List",
      body: ListView(
        children: state
            .map(
              (item) => CheckboxListTile(
                value: item.hasBought,
                title: Text(item.name),
                subtitle: Text("Quantity: ${item.quantity}"),
                secondary: item.isSpicy ? Text("🌶️ Spicy") : null,
                onChanged: (_) {
                  ref
                      .read(shoppingListProvider.notifier)
                      .toggleHasBought(name: item.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
