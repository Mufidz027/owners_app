// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // ignore: unused_import
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:owners_app/barberScreens/home_screen.dart';
// import 'package:owners_app/global/global.dart';
// import 'package:owners_app/models/barber.dart';
// import 'package:owners_app/widgets/progress_bar.dart';
// // ignore: library_prefixes
// import 'package:firebase_storage/firebase_storage.dart' as fStorage;

// // ignore: must_be_immutable
// class UploadItemsScreen extends StatefulWidget {
//   Barber? model;
//   // ignore: use_key_in_widget_constructors
//   UploadItemsScreen({
//     this.model,
//   });
//   @override
//   // ignore: library_private_types_in_public_api
//   _UploadItemsScreenState createState() => _UploadItemsScreenState();
// }

// class _UploadItemsScreenState extends State<UploadItemsScreen> {
//   XFile? imgXFile;

//   final ImagePicker imagePicker = ImagePicker();

//   // TextEditingController barberNameTextEditingController =
//   //     TextEditingController();
//   TextEditingController itemsDescriptionTextEditingController =
//       TextEditingController();

//   bool uploading = false;
//   String downloadUrlImage = "";
//   String itemsUniqueId = DateTime.now().millisecondsSinceEpoch.toString();
//   saveBarberInfo() {
//     FirebaseFirestore.instance
//         .collection("owners")
//         .doc(sharedPreferences!.getString("uid"))
//         .collection("barber")
//         .doc(widget.model!.barberID)
//         .collection("items")
//         .doc(itemsUniqueId)
//         .set({
//       "itemsID": itemsUniqueId,
//       "barberID": widget.model!.barberID.toString(),
//       "barberUID": sharedPreferences!.getString("uid"),
//       // "barberName": sharedPreferences!.getString("uid"),
//       "longDescription": itemsDescriptionTextEditingController.text.trim(),
//       // "barberName": barberNameTextEditingController.text.trim(),
//       "publisheDate": DateTime.now(),
//       "status": "available",
//       "thumbnailUrl": downloadUrlImage,
//     }).then((value) {
//       FirebaseFirestore.instance.collection("items").doc(itemsUniqueId).set({
//         "itemsID": itemsUniqueId,
//         "barberID": widget.model!.barberID.toString(),
//         "barberUID": sharedPreferences!.getString("uid"),
//         // "barberName": sharedPreferences!.getString("uid"),
//         "longDescription": itemsDescriptionTextEditingController.text.trim(),
//         // "barberName": barberNameTextEditingController.text.trim(),
//         "publisheDate": DateTime.now(),
//         "status": "available",
//         "thumbnailUrl": downloadUrlImage,
//       });
//     });
//     setState(() {
//       uploading = false;
//       itemsUniqueId = DateTime.now().millisecondsSinceEpoch.toString();
//     });
//     Navigator.push(
//         context, MaterialPageRoute(builder: (c) => const homeScreen()));
//   }

//   validateUploadForm() async {
//     if (imgXFile != null) {
//       if (itemsDescriptionTextEditingController.text.isNotEmpty
//           // &&
//           //     barberNameTextEditingController.text.isNotEmpty
//           ) {
//         setState(() {
//           uploading = true;
//         });
//         //1.upload image to storage - get download url

//         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//         fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
//             .ref()
//             .child("ownersItemsImages")
//             .child(fileName);

//         fStorage.UploadTask uploadImageTask =
//             storageRef.putFile(File(imgXFile!.path));
//         fStorage.TaskSnapshot taskSnapshot =
//             await uploadImageTask.whenComplete(() {});
//         await taskSnapshot.ref.getDownloadURL().then((urlImage) {
//           downloadUrlImage = urlImage;
//         });

//         //2.save barber info to firestore database
//         saveBarberInfo();
//       } else {
//         Fluttertoast.showToast(msg: "Tolong isi deskripsi barber.");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Tolong masukkan gambar.");
//     }
//   }

//   uploadFormScreen() {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_rounded),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (c) => const homeScreen()));
//             },
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // validate uploud form
//               uploading == true ? null : validateUploadForm();
//             },
//             icon: const Icon(Icons.check),
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 6, 79, 204),
//                 Colors.black,
//               ],
//               begin: FractionalOffset(0.0, 0.0),
//               end: FractionalOffset(1.0, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         ),
//         title: const Text("Upload New Barbers Photos"),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           uploading == true ? linearProgressBar() : Container(),
//           //image

//           Container(
//             //in video SizeBox
//             color: Colors.black,
//             alignment: Alignment.center,
//             height: 230,
//             width: double.infinity,
//             child: Center(
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                     image: FileImage(
//                       File(
//                         imgXFile!.path,
//                       ),
//                     ),
//                   )),
//                 ),
//               ),
//             ),
//           ),
//           const Divider(
//             color: Colors.blueAccent,
//             thickness: 1,
//           ),

//           //barber titel

//           // ListTile(
//           //   leading: const Icon(
//           //     Icons.store_outlined,
//           //     color: Color.fromARGB(255, 8, 5, 185),
//           //   ),
//           //   title: SizedBox(
//           //     width: 250,
//           //     child: TextField(
//           //       controller: barberNameTextEditingController,
//           //       decoration: const InputDecoration(
//           //           hintText: "Nama Barber",
//           //           hintStyle: TextStyle(color: Colors.grey),
//           //           border: InputBorder.none),
//           //     ),
//           //   ),
//           // ),
//           // const Divider(
//           //   color: Colors.blueAccent,
//           //   thickness: 1,
//           // ),

//           //barber info image
//           ListTile(
//             leading: const Icon(
//               Icons.description_rounded,
//               color: Color.fromARGB(255, 8, 5, 185),
//             ),
//             title: SizedBox(
//               width: 250,
//               child: TextField(
//                 controller: itemsDescriptionTextEditingController,
//                 decoration: const InputDecoration(
//                     hintText: "Deskripsi",
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: InputBorder.none),
//               ),
//             ),
//           ),
//           const Divider(
//             color: Colors.blueAccent,
//             thickness: 1,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return imgXFile == null ? defaultScreen() : uploadFormScreen();
//   }

//   defaultScreen() {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 6, 79, 204),
//                 Colors.black,
//               ],
//               begin: FractionalOffset(0.0, 0.0),
//               end: FractionalOffset(1.0, 0.0),
//               stops: [0.0, 1.0],
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         ),
//         title: const Text("Tambah Foto Barber"),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 6, 79, 204),
//               Colors.black,
//             ],
//             begin: FractionalOffset(0.0, 0.0),
//             end: FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.add_photo_alternate_rounded,
//                 color: Colors.white,
//                 size: 200,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     obtainImageDialogBox();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     // ignore: prefer_const_constructors
//                     primary: Color.fromRGBO(5, 217, 255, 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   child: const Text(
//                     "Masukkan foto barber",
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   obtainImageDialogBox() {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return SimpleDialog(
//             title: const Text(
//               "Add Barber photo",
//               style: TextStyle(
//                 color: Color.fromRGBO(5, 217, 255, 1),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             children: [
//               SimpleDialogOption(
//                 onPressed: () {
//                   captureImageWithPhoneCamera();
//                 },
//                 child: const Text(
//                   "Gunakan kamera",
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SimpleDialogOption(
//                 onPressed: () {
//                   getImageFromGallerry();
//                 },
//                 child: const Text(
//                   "Pilih dari Galeri",
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SimpleDialogOption(
//                 onPressed: () {},
//                 child: const Text(
//                   "Cancel",
//                   style: TextStyle(
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         });
//   }

//   getImageFromGallerry() async {
//     Navigator.pop(context);
//     imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       imgXFile;
//     });
//   }

//   captureImageWithPhoneCamera() async {
//     Navigator.pop(context);
//     imgXFile = await imagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       imgXFile;
//     });
//   }
// }
