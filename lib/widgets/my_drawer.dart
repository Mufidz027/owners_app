// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';
import '../splashScreen/my_splash_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black45,
      child: ListView(
        children: [
          //header
          Container(
            padding: const EdgeInsets.only(top: 26, bottom: 12),
            child: Column(
              children: [
                //user profileimage
                SizedBox(
                  height: 140,
                  width: 140,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      sharedPreferences!.getString("photoUrl")!,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                //username
                Text(
                  sharedPreferences!.getString("name")!,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),

          //body
          Container(
            padding: const EdgeInsets.only(top: 1),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 2,
                ),

                //home
                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Beranda",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),

                //pemesanan

                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Pemesanan",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),

                //Not yet recived order

                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.picture_in_picture_alt,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Belum menerima pesanan",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                //garis
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),

                //riwayat

                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.timelapse_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Riwayat",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),

                //search

                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "pencarian",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),

                //logout

                ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const MySplashScreen()));
                  },
                ),
                // const Divider(
                //   height: 10,
                //   color: Colors.white,
                //   thickness: 2,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
