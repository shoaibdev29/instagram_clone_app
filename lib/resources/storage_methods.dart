import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  //for firebase storage (not use because card not accepted)
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //for cloudinary storage
  final String cloudName = "dh6ofah9d";
  final String uploadPreset = "instaClonePreset";
  //adding image to firebase storage
  // Future<String> uploadImagetoFirebaseStorage(
  //   String childName,
  //   Uint8List file,
  //   bool isPost,
  // ) async {
  //   Reference ref = _storage
  //       .ref()
  //       .child(childName)
  //       .child(_auth.currentUser!.uid);
  //   UploadTask uploadTask = ref.putData(file);
  //   TaskSnapshot snap = await uploadTask;
  //   String downloadUrl = await snap.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  //adding image to cloudinary free

  Future<String> uploadImageToCloudinary(Uint8List file) async {
    try {
      // Cloudinary POST URL
      var url = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
      );

      // Convert Uint8List → base64
      String base64Image = base64Encode(file);

      // Body data
      var body = {
        "file": "data:image/png;base64,$base64Image",
        "upload_preset": uploadPreset,
      };

      // Send request
      var response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData["secure_url"]; // ✅ Image URL
      } else {
        print("Cloudinary error: ${response.body}");
        return "";
      }
    } catch (e) {
      print("Upload failed: $e");
      return "";
    }
  }
}
