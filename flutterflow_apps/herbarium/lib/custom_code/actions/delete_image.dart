// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<String> deleteImage(String urlFile) async {
  String error = ''; // Initialize error with an empty string
  try {
    await FirebaseStorage.instance.refFromURL(urlFile).delete();
    return 'Image deleted successfully';
  } catch (e) {
    error = e.toString(); // Convert the caught exception to a string
  }
  return error;
}
