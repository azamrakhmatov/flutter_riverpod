import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_app/layout/default_layout.dart';
import 'package:getx_app/riverpod/provider.dart';
import 'package:getx_app/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
      title: "ProviderScreen",
      actions: [
        PopupMenuButton<FilterState>(

          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
          itemBuilder: (_) => FilterState.values
              .map(
                (item) => PopupMenuItem(
                  value: item,
                  child: Text(item.name),
                ),
              )
              .toList(),
        ),
      ],
      body: ListView(
        children: state
            .map(
              (item) => CheckboxListTile(
                value: item.hasBought,
                title: Text(item.name),
                subtitle: Text("Quantity: ${item.quantity}"),
                secondary: item.isSpicy ? const Text("🌶️ Spicy") : null,
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
