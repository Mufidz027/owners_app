import 'package:flutter/material.dart';

class LoadingDialogWidget extends StatelessWidget {
  final String? message;
  // ignore: use_key_in_widget_constructors
  const LoadingDialogWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //circular progres bar
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 14),
            child: const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Color.fromARGB(255, 4, 118, 211)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text("$message, Tunggu sebentar..."),
        ],
      ),
    );
  }
}
