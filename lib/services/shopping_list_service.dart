import 'package:maqadi/data/dummy/lists_dummy.dart';
import 'package:maqadi/data/shopping_list_item.dart';

class ShoppingListService {
  static var _dummy = LIST_DUMMY;

  static Future<dynamic> getShoppingDummy() async {
    return _dummy;
  }

  static createShoppingItem(ShoppingListItem shoppingListItem) {
    _dummy.list.add(shoppingListItem);
  }
}