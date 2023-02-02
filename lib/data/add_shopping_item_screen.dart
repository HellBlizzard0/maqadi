import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maqadi/data/shopping_list_item.dart';

class AddShoppingItemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends State<AddShoppingItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ShoppingListItem _newItem = ShoppingListItem(name: "", count: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Window")),
        body: Form(
          key: _formKey,
          child: Table(children: [
            TableRow(children: [
              Container(
                alignment: Alignment.centerRight,
                child: const Icon(Icons.app_registration, size: 50),
              ),
              TextFormField(
                onChanged: (value) => _newItem.name = value,
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.centerRight,
                child: const Icon(Icons.app_registration, size: 50),
              ),
            ]),
            TableRow(children: [
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("Submit"),
                  onPressed: () => {},
                ),
              ),
            ]),
          ]),
        ));
  }
}