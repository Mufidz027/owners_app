import 'package:flutter/material.dart';
import 'package:owners_app/authScreen/registrasi_tab_page.dart';

import 'login_tab_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 6, 79, 204),
                  Colors.red,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: const Text(
            "Barber App",
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: [
              Tab(
                text: "LOGIN",
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "REGISTRASI",
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: const TabBarView(
            children: [
              LoginTabPage(),
              RegistrasiTabPage(),
            ],
          ),
        ),
      ),
    );
  }
}
