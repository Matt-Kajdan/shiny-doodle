import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_widget.dart' show EditWidget;
import 'package:flutter/material.dart';

class EditModel extends FlutterFlowModel<EditWidget> {
  ///  Local state fields for this page.

  bool imgRemoved = false;

  int loopNumber = 0;

  int mergeCounter = 0;

  List<FFUploadedFile> mergedImages = [];
  void addToMergedImages(FFUploadedFile item) => mergedImages.add(item);
  void removeFromMergedImages(FFUploadedFile item) => mergedImages.remove(item);
  void removeAtIndexFromMergedImages(int index) => mergedImages.removeAt(index);
  void insertAtIndexInMergedImages(int index, FFUploadedFile item) =>
      mergedImages.insert(index, item);
  void updateMergedImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      mergedImages[index] = updateFn(mergedImages[index]);

  List<String> existingImages = [];
  void addToExistingImages(String item) => existingImages.add(item);
  void removeFromExistingImages(String item) => existingImages.remove(item);
  void removeAtIndexFromExistingImages(int index) =>
      existingImages.removeAt(index);
  void insertAtIndexInExistingImages(int index, String item) =>
      existingImages.insert(index, item);
  void updateExistingImagesAtIndex(int index, Function(String) updateFn) =>
      existingImages[index] = updateFn(existingImages[index]);

  List<String> firestoreToDelete = [];
  void addToFirestoreToDelete(String item) => firestoreToDelete.add(item);
  void removeFromFirestoreToDelete(String item) =>
      firestoreToDelete.remove(item);
  void removeAtIndexFromFirestoreToDelete(int index) =>
      firestoreToDelete.removeAt(index);
  void insertAtIndexInFirestoreToDelete(int index, String item) =>
      firestoreToDelete.insert(index, item);
  void updateFirestoreToDeleteAtIndex(int index, Function(String) updateFn) =>
      firestoreToDelete[index] = updateFn(firestoreToDelete[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for LatinName widget.
  FocusNode? latinNameFocusNode;
  TextEditingController? latinNameTextController;
  String? Function(BuildContext, String?)? latinNameTextControllerValidator;
  // State field(s) for EnglishName widget.
  FocusNode? englishNameFocusNode;
  TextEditingController? englishNameTextController;
  String? Function(BuildContext, String?)? englishNameTextControllerValidator;
  // State field(s) for PolishName widget.
  FocusNode? polishNameFocusNode;
  TextEditingController? polishNameTextController;
  String? Function(BuildContext, String?)? polishNameTextControllerValidator;
  // State field(s) for FamilyName widget.
  FocusNode? familyNameFocusNode;
  TextEditingController? familyNameTextController;
  String? Function(BuildContext, String?)? familyNameTextControllerValidator;
  bool isDataUploading_localEditUploads1 = false;
  List<FFUploadedFile> uploadedLocalFiles_localEditUploads1 = [];

  bool isDataUploading_localEditUploads2 = false;
  List<FFUploadedFile> uploadedLocalFiles_localEditUploads2 = [];

  // Stores action output result for [Alert Dialog - Custom Dialog] action in ClearImages widget.
  bool? clearImagesDialogOutput;
  // State field(s) for MapHabitat widget.
  List<String>? mapHabitatValue;
  FormFieldController<List<String>>? mapHabitatValueController;
  // State field(s) for TextHabitat widget.
  FocusNode? textHabitatFocusNode;
  TextEditingController? textHabitatTextController;
  String? Function(BuildContext, String?)? textHabitatTextControllerValidator;
  // State field(s) for Appearance widget.
  FocusNode? appearanceFocusNode;
  TextEditingController? appearanceTextController;
  String? Function(BuildContext, String?)? appearanceTextControllerValidator;
  // State field(s) for Meaning widget.
  FocusNode? meaningFocusNode;
  TextEditingController? meaningTextController;
  String? Function(BuildContext, String?)? meaningTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_firestoreEditUploads = false;
  List<FFUploadedFile> uploadedLocalFiles_firestoreEditUploads = [];
  List<String> uploadedFileUrls_firestoreEditUploads = [];

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Delete widget.
  bool? deleteDialOutput;
  // Stores action output result for [Custom Action - deleteImage] action in Delete widget.
  String? deleteImgTaskDel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    latinNameFocusNode?.dispose();
    latinNameTextController?.dispose();

    englishNameFocusNode?.dispose();
    englishNameTextController?.dispose();

    polishNameFocusNode?.dispose();
    polishNameTextController?.dispose();

    familyNameFocusNode?.dispose();
    familyNameTextController?.dispose();

    textHabitatFocusNode?.dispose();
    textHabitatTextController?.dispose();

    appearanceFocusNode?.dispose();
    appearanceTextController?.dispose();

    meaningFocusNode?.dispose();
    meaningTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
