import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

linearProgressBar() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 14),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 4, 118, 211)),
    ),
  );
}
