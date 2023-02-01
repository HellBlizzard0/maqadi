import 'package:flutter/cupertino.dart';
import 'package:maqadi/data/dummy/lists_dummy.dart';
import 'package:maqadi/data/shopping_list.dart';
import 'package:maqadi/data/shopping_list_item.dart';

class ShoppingListService {
  static Future<dynamic> getShoppingDummy() async {
    var res = LIST_DUMMY;
    return res;
  }


}