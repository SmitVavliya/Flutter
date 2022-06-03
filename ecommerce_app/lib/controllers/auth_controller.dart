// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List?> pickImgage(ImageSource source) async {
    Uint8List? file;

    try {
      final ImagePicker _imagePicker = ImagePicker();
      XFile? _file = await _imagePicker.pickImage(source: source);

      if (_file != null) {
        file = await _file.readAsBytes();
      } else {
        print("No Image Selected.");
      }
    } catch (e) {
      print("pickImage $e");
    }

    return file;
  }

  Future<String?> _uploadImageToFirestore(Uint8List? image) async {
    String? downloadUrl;

    try {
      Reference ref = _firebaseStorage
          .ref()
          .child("profileImages")
          .child(_firebaseAuth.currentUser!.uid);
      UploadTask uploadTask = ref.putData(image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      downloadUrl = await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print("_uploadImageToFirestore: $e");
    }

    return downloadUrl;
  }

  Future<String> signUpUser(
    String fullName,
    String userName,
    String email,
    String password,
    Uint8List? image,
  ) async {
    String res = "Some Error Occured.";

    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (image == null) {
        return "Please first upload your image.";
      }

      String? imageUrl = await _uploadImageToFirestore(image);

      await _firebaseFirestore
          .collection("users")
          .doc(userCredential.user?.uid)
          .set(
        {
          "fullName": fullName,
          "userName": userName,
          "email": email,
          "image": imageUrl
        },
      );

      res = "Success";
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    } on FirebaseException catch (e) {
      res = e.message.toString();
    }

    return res;
  }

  Future<String> signInUser(String email, String password) async {
    String res;

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      res = "Success";
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    } on FirebaseException catch (e) {
      res = e.message.toString();
    }

    return res;
  }

  showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
