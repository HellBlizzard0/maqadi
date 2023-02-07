import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maqadi/data/shopping_list_item.dart';

import '../services/shopping_list_service.dart';

class AddShoppingItemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends State<AddShoppingItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShoppingListItem _newItem = ShoppingListItem(name: "", count: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Window")),
        body: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Column(children: [
                Table(children: [
                  TableRow(children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.app_registration, size: 50),
                    ),
                    TextFormField(
                      onChanged: (value) => _newItem.name = value,
                    ),
                    Container(),
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.app_registration, size: 50),
                    ),
                    Slider(
                      value: _newItem.count.roundToDouble(),
                      min: 1,
                      max: 20,
                      label: _newItem.count.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _newItem.count = value.round();
                        });
                      },
                    ),
                    Container(),
                  ]),
                ]),
                Center(
                  child: TextButton(
                    onPressed: () => submitItem(),
                    child: const Text("Submit"),
                  ),
                )
              ]),
            )));
  }

  submitItem() {
    ShoppingListService.createShoppingItem(_newItem);
    Navigator.pop(context);
  }
}