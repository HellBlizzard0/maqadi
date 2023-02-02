import 'package:flutter/material.dart';
import 'package:maqadi/services/shopping_list_service.dart';

import 'data/add_shopping_item_screen.dart';
import 'data/shopping_list.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<bool> checkboxList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shop List")),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddShoppingItemScreen()));
          }),
      body: FutureBuilder(
          future: ShoppingListService.getShoppingDummy(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text("No Data");
            } else if (snapshot.hasError) {
              return const Text("Error");
            } else {
              ShoppingList sl = (snapshot.data as ShoppingList);
              sl.list.length;

              for (int i = 0; i < sl.list.length; i++) {
                checkboxList.add(i % 2 == 0);
              }
              return ListView.builder(
                itemCount: sl.list.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Checkbox(
                                value: checkboxList[index],
                                onChanged: (bool? value) {
                                  checkboxList[index] = value as bool;
                                  setState(() {
                                    checkboxList[index] = value;
                                  });
                                }),
                            Text(sl.list[index].name +
                                ", x" +
                                sl.list[index].count.toString()),
                          ],
                        ),
                      ],
                    ),
                    color: const Color.fromRGBO(255, 10, 10, 65),
                  );
                },
              );
            }
          }),
    );
  }
}