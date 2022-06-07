// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:owners_app/barberScreens/barber_ui_design_widget.dart';
import 'package:owners_app/barberScreens/upload_kepster_screen.dart';
import 'package:owners_app/global/global.dart';
import 'package:owners_app/models/barber.dart';
import 'package:owners_app/widgets/text_delegate_header_widget.dart';

import '../widgets/my_drawer.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: const Text(
          "Barber App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => const UploadKepsterScreen()));
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TextDelegateHeaderWidget(title: "My Barbers"),
          ),

          //1. write query
          //2. model
          //3. design widget

          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("owners")
                .doc(sharedPreferences!.getString("uid"))
                .collection("barber")
                .orderBy("publisheDate", descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot dataSnapshot) {
              if (dataSnapshot.hasData) // if barber exists
              {
                //display barber
                return SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 1,
                  staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                  itemBuilder: (context, index) {
                    Barber barberModel = Barber.fromJson(
                      dataSnapshot.data.docs[index].data()
                          as Map<String, dynamic>,
                    );
                    return BarberUiDesignWidget(
                      model: barberModel,
                      context: context,
                    );
                  },
                  itemCount: dataSnapshot.data.docs.length,
                );
              } else // if barber NOT exists
              {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "Tidak ada barber",
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
