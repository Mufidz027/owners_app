import 'package:flutter/material.dart';
import 'package:owners_app/barberScreens/barber_details_screen.dart';
import 'package:owners_app/models/barber.dart';

// ignore: must_be_immutable
class BarberUiDesignWidget extends StatefulWidget {
  Barber? model;
  BuildContext? context;

  // ignore: use_key_in_widget_constructors
  BarberUiDesignWidget({
    this.model,
    this.context,
  });
  @override
  // ignore: library_private_types_in_public_api
  State<BarberUiDesignWidget> createState() => _BarberUiDesignWidgetState();
}

class _BarberUiDesignWidgetState extends State<BarberUiDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => BarberDetailsScreen(
                      model: widget.model,
                    )));
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.black,
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Image.network(
                widget.model!.thumbnailUrl.toString(),
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model!.barberName.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 3,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_sweep,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
