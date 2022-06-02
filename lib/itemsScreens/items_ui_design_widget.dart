import 'package:flutter/material.dart';
import 'package:owners_app/itemsScreens/items_screen.dart';
import 'package:owners_app/models/barber.dart';
import 'package:owners_app/models/items.dart';

// ignore: must_be_immutable
class ItemsUiDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  // ignore: use_key_in_widget_constructors
  ItemsUiDesignWidget({
    this.model,
    this.context,
  });
  @override
  // ignore: library_private_types_in_public_api
  State<ItemsUiDesignWidget> createState() => _ItemsUiDesignWidgetState();
}

class _ItemsUiDesignWidgetState extends State<ItemsUiDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (c) => ItemsScreen(
        //               model: widget.model,
        //             )));
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Text(
                widget.model!.itemsName.toString(),
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Image.network(
                widget.model!.thumbnailUrl.toString(),
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.model!.itemsInfo.toString(),
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
