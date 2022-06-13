import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: library_prefixes
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

import '../global/global.dart';
import '../splashScreen/my_splash_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/loading_dialog.dart';

class RegistrasiTabPage extends StatefulWidget {
  const RegistrasiTabPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrasiTabPageState createState() => _RegistrasiTabPageState();
}

class _RegistrasiTabPageState extends State<RegistrasiTabPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String downloadUrlImage = "";

  XFile? imgXFile;

  final ImagePicker imagePicker = ImagePicker();
  getImageFromGallerry() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  formValidation() async {
    if (imgXFile == null) //image is not selected
    {
      Fluttertoast.showToast(msg: "Tolong Masukkan Gambar.");
    } else //image is already selected
    {
      //password is equal to confirm pasword
      if (passwordTextEditingController.text ==
          confirmPasswordTextEditingController.text) {
        //cek email, password, confirm password dan nama
        if (nameTextEditingController.text.isNotEmpty &&
            emailTextEditingController.text.isNotEmpty &&
            passwordTextEditingController.text.isNotEmpty &&
            confirmPasswordTextEditingController.text.isNotEmpty &&
            phoneTextEditingController.text.isNotEmpty &&
            locationTextEditingController.text.isNotEmpty) {
          showDialog(
              context: context,
              builder: (c) {
                return const LoadingDialogWidget(
                  message: "registring Your Account",
                );
              });
          //1.uploud image to storage
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
              .ref()
              .child("ownersImages")
              .child(fileName);

          fStorage.UploadTask uploadImageTask =
              storageRef.putFile(File(imgXFile!.path));
          fStorage.TaskSnapshot taskSnapshot =
              await uploadImageTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((urlImage) {
            downloadUrlImage = urlImage;
          });

          //2.save the user info to firebasedatabase
          saveInformationToDatabase();
        } else {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg:
                  "Tolong selesaikan pengisian. jangan biarkan form pengisian kosong.");
        }
      } else //password is not equal to confirm pasword
      {
        Fluttertoast.showToast(
            msg: "Password dan Confirm Password tidak cocok.");
      }
    }
  }

  saveInformationToDatabase() async {
    //authenticat the user firts
    User? currentUser;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred: \n $errorMessage");
    });
    if (currentUser != null) {
      //save info to database and save locally
      saveInfoToFirestoreAndLocally(currentUser!);
    }
  }

  saveInfoToFirestoreAndLocally(User currentUser) async {
    //save to firestore
    FirebaseFirestore.instance.collection("owners").doc(currentUser.uid).set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": nameTextEditingController.text.trim(),
      "photoUrl": downloadUrlImage,
      "phone": phoneTextEditingController.text.trim(),
      "address": locationTextEditingController.text.trim(),
      "status": "approved",
      "earnings": 0.0,
    });
    //save locally
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email!);
    await sharedPreferences!
        .setString("name", nameTextEditingController.text.trim());
    await sharedPreferences!.setString("photoUrl", downloadUrlImage);

    // ignore: use_build_context_synchronously

    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            //get-capture image
            GestureDetector(
              onTap: () {
                getImageFromGallerry();
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.15,
                backgroundColor: Colors.white,
                backgroundImage:
                    imgXFile == null ? null : FileImage(File(imgXFile!.path)),
                child: imgXFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.15,
                      )
                    : null,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            //input form fields
            Form(
              key: formkey,
              child: Column(
                children: [
                  //name
                  CustomTextField(
                    textEditingController: nameTextEditingController,
                    iconData: Icons.person,
                    hintText: "Nama Barbershop",
                    isObsecre: false,
                    enabled: true,
                  ),
                  //email
                  CustomTextField(
                    textEditingController: emailTextEditingController,
                    iconData: Icons.email,
                    hintText: "Emailnya juga",
                    isObsecre: false,
                    enabled: true,
                  ),

                  //phone
                  CustomTextField(
                    textEditingController: phoneTextEditingController,
                    iconData: Icons.phone,
                    hintText: "Telepon",
                    isObsecre: false,
                    enabled: true,
                  ),

                  //location
                  CustomTextField(
                    textEditingController: locationTextEditingController,
                    iconData: Icons.home,
                    hintText: "Alamat",
                    isObsecre: false,
                    enabled: true,
                  ),

                  //password
                  CustomTextField(
                    textEditingController: passwordTextEditingController,
                    iconData: Icons.lock,
                    hintText: "Password 6 digit",
                    isObsecre: true,
                    enabled: true,
                  ),
                  //confirm password
                  CustomTextField(
                    textEditingController: confirmPasswordTextEditingController,
                    iconData: Icons.handshake_rounded,
                    hintText: "Confirm Password",
                    isObsecre: true,
                    enabled: true,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 4, 107, 190),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                formValidation();
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
