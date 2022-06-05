import 'package:flutter/material.dart';
import 'package:owners_app/models/items.dart';

class ItemsDetailScreen extends StatefulWidget {
  Items? model;
  ItemsDetailScreen({
    this.model,
  });
  @override
  _ItemsDetailScreenState createState() => _ItemsDetailScreenState();
}

class _ItemsDetailScreenState extends State<ItemsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.model.item),
        // ),
        );
  }
}
