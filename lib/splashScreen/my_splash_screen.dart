import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../mainScreens/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  splashScreenTimer() {
    Timer(const Duration(seconds: 2), () async {
      //owner is alreadi login-in
      if (FirebaseAuth.instance.currentUser != null) {
        //Navigator.push(
        //     context, MaterialPageRoute(builder: (c) => const homeScreen()));
      } else //owner is not alreadi login-in
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const homeScreen()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    splashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset("images/gambar3.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Owner Barbers App",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
