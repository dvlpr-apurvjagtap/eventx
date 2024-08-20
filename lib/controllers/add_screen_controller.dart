import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreenController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker imagePicker = ImagePicker();
  Uint8List? image;

  // Method to pick an image from the gallery
  pickImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = await file.readAsBytes();
      notifyListeners();
    } else {
      print("No image selected");
    }
  }

  // Method to upload the image and get the download URL
  Future<String> uploadImage(Uint8List file, String eventId) async {
    try {
      Reference ref = _storage.ref().child("eventPicture").child(eventId);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  // Method to add an event to the Firestore collection
  Future<void> addEvent({
    required String name,
    required String location,
    required String price,
    required Uint8List? file,
  }) async {
    if (file == null) {
      print("No image file provided");
      return;
    }

    try {
      DocumentReference documentReference =
          _firestore.collection("events").doc();
      String eventId = documentReference.id;

      String photoUrl = await uploadImage(file, eventId);

      await documentReference.set({
        'id': eventId,
        'name': name,
        'location': location,
        'price': price,
        'photurl': photoUrl,
        'timestamp': Timestamp.now(),
      });

      print("Event added successfully");
    } catch (e) {
      print("Error adding event: $e");
    }
  }
}
