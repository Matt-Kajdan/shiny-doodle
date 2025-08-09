import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? imagesCalculator(
  List<String>? previousImagesParam,
  List<String>? imagesToDelete,
  List<String>? uploadedImages,
) {
  // Initialize the result list with the previous images, or an empty list if null
  List<String> result = previousImagesParam?.toList() ?? [];

  // Remove images that are in the imagesToDelete list
  if (imagesToDelete != null && imagesToDelete.isNotEmpty) {
    result.removeWhere((image) => imagesToDelete.contains(image));
  }

  // Add new uploaded images
  if (uploadedImages != null && uploadedImages.isNotEmpty) {
    result.addAll(uploadedImages);
  }

  return result;
}

// Returns preferred display name for a plant based on settings and fallbacks
String resolvePlantDisplayName(
  PlantsRecord plant, {
  required bool preferPolish,
}) {
  final hasCommon = plant.nameCommon.isNotEmpty;
  final hasPolish = plant.namePolish.isNotEmpty;
  final hasLatin = plant.nameLatin.isNotEmpty;

  if (preferPolish) {
    final primary = hasPolish ? plant.namePolish : (hasCommon ? plant.nameCommon : '');
    if (primary.isNotEmpty) return primary;
    return hasLatin ? plant.nameLatin : '';
  } else {
    final primary = hasCommon ? plant.nameCommon : '';
    if (primary.isNotEmpty) return primary;
    return hasPolish ? plant.namePolish : (hasLatin ? plant.nameLatin : '');
  }
}
