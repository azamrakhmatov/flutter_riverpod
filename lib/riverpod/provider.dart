import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:getx_app/model/shopping_item_model.dart';
import 'package:getx_app/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingList = ref.watch(shoppingListProvider);

    if(filterState == FilterState.all) {
      return shoppingList;
    } else if (filterState == FilterState.spicy) {
      return shoppingList.where((item) => item.isSpicy).toList();
    } else if (filterState == FilterState.notSpicy) {
      return shoppingList.where((item) => !item.isSpicy).toList();
    }

    return [];
  
  }


);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);