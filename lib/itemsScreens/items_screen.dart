// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:owners_app/itemsScreens/items_ui_design_widget.dart';
// import 'package:owners_app/itemsScreens/upload_items_screen.dart';
// import 'package:owners_app/models/items.dart';

// import '../global/global.dart';
// import '../models/barber.dart';
// import '../widgets/text_delegate_header_widget.dart';

// // ignore: must_be_immutable
// class ItemsScreen extends StatefulWidget {
//   Barber? model;

//   // ignore: use_key_in_widget_constructors
//   ItemsScreen({
//     this.model,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _ItemsScreenState createState() => _ItemsScreenState();
// }

// class _ItemsScreenState extends State<ItemsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 6, 79, 204),
//                 Colors.red,
//               ],
//               begin: FractionalOffset(0.0, 0.0),
//               end: FractionalOffset(1.0, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         ),
//         title: const Text(
//           "Barber App",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (c) => UploadItemsScreen(
//                             model: widget.model,
//                           )));
//             },
//             icon: const Icon(
//               Icons.add_box_rounded,
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverPersistentHeader(
//             pinned: true,
//             delegate: TextDelegateHeaderWidget(
//                 title: widget.model!.barberName.toString()), //+ " Items"
//           ),

//           //1. write query
//           //2. model
//           //3. design widget

//           StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection("owners")
//                 .doc(sharedPreferences!.getString("uid"))
//                 .collection("barber")
//                 .doc(widget.model!.barberID)
//                 .collection("items")
//                 .orderBy("publisheDate", descending: true)
//                 .snapshots(),
//             builder: (context, AsyncSnapshot dataSnapshot) {
//               if (dataSnapshot.hasData) // if barber exists
//               {
//                 //display barber
//                 return SliverStaggeredGrid.countBuilder(
//                   crossAxisCount: 1,
//                   staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
//                   itemBuilder: (context, index) {
//                     // ignore: unused_local_variable
//                     Items itemsModel = Items.fromJson(
//                       dataSnapshot.data.docs[index].data()
//                           as Map<String, dynamic>,
//                     );
//                     return ItemsUiDesignWidget(
//                       model: itemsModel,
//                       context: context,
//                     );
//                   },
//                   itemCount: dataSnapshot.data.docs.length,
//                 );
//               } else // if barber NOT exists
//               {
//                 return const SliverToBoxAdapter(
//                   child: Center(
//                     child: Text(
//                       "Tidak ada foto barber",
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
