// import 'package:flutter/material.dart';
// import 'package:owners_app/models/items.dart';

// // ignore: must_be_immutable
// class ItemsUiDesignWidget extends StatefulWidget {
//   Items? model;
//   BuildContext? context;

//   // ignore: use_key_in_widget_constructors
//   ItemsUiDesignWidget({
//     this.model,
//     this.context,
//   });
//   @override
//   // ignore: library_private_types_in_public_api
//   State<ItemsUiDesignWidget> createState() => _ItemsUiDesignWidgetState();
// }

// class _ItemsUiDesignWidgetState extends State<ItemsUiDesignWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () {
//       //   // Navigator.push(
//       //   //     context,
//       //   //     MaterialPageRoute(
//       //   //         builder: (c) => ItemsDetailScreen(
//       //   //               model: widget.model,
//       //   // )));
//       // },
//       child: Card(
//         elevation: 10,
//         shadowColor: Colors.white,
//         child: Container(
//           alignment: Alignment.center,
//           width: double.infinity,
//           color: Colors.black,
//           padding: const EdgeInsets.all(4),
//           child: SizedBox(
//             height: 290,
//             width: MediaQuery.of(context).size.width,
//             child: Column(children: [
//               Image.network(
//                 widget.model!.thumbnailUrl.toString(),
//                 height: 240,
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 widget.model!.longDescription.toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                   letterSpacing: 1,
//                 ),
//               ),
//               const SizedBox(
//                 height: 1,
//               ),
//               // Text(
//               //   widget.model!.itemsDescrption.toString(),
//               //   style: const TextStyle(
//               //     color: Colors.blueAccent,
//               //     fontSize: 14,
//               //   ),
//               // ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
