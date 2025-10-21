import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:getx_app/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) {
  return ShoppingListNotifier();
});

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
            name: "banana",
            quantity: 10,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: "apple",
            quantity: 5,
            hasBought: true,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: "orange",
            quantity: 8,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: "grape",
            quantity: 12,
            hasBought: true,
            isSpicy: false,
          ),
        ]);

  void toggleHasBought({required String name}) {
    state = state
        .map((item) => item.name == name
            ? ShoppingItemModel(
                name: item.name,
                quantity: item.quantity,
                hasBought: !item.hasBought,
                isSpicy: item.isSpicy,
              )
            : item)
        .toList();
  }
}
