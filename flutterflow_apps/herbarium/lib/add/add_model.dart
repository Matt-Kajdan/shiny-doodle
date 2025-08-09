import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_widget.dart' show AddWidget;
import 'package:flutter/material.dart';

class AddModel extends FlutterFlowModel<AddWidget> {
  ///  Local state fields for this page.

  List<String> uploadedLocalImgs = [];
  void addToUploadedLocalImgs(String item) => uploadedLocalImgs.add(item);
  void removeFromUploadedLocalImgs(String item) =>
      uploadedLocalImgs.remove(item);
  void removeAtIndexFromUploadedLocalImgs(int index) =>
      uploadedLocalImgs.removeAt(index);
  void insertAtIndexInUploadedLocalImgs(int index, String item) =>
      uploadedLocalImgs.insert(index, item);
  void updateUploadedLocalImgsAtIndex(int index, Function(String) updateFn) =>
      uploadedLocalImgs[index] = updateFn(uploadedLocalImgs[index]);

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
  bool isDataUploading_localAddUploads1 = false;
  List<FFUploadedFile> uploadedLocalFiles_localAddUploads1 = [];

  bool isDataUploading_localAddUploads2 = false;
  List<FFUploadedFile> uploadedLocalFiles_localAddUploads2 = [];

  // Stores action output result for [Alert Dialog - Custom Dialog] action in ClearImages widget.
  bool? clearImagesDialogOutput;
  // State field(s) for Appearance widget.
  FocusNode? appearanceFocusNode;
  TextEditingController? appearanceTextController;
  String? Function(BuildContext, String?)? appearanceTextControllerValidator;
  // State field(s) for Meaning widget.
  FocusNode? meaningFocusNode;
  TextEditingController? meaningTextController;
  String? Function(BuildContext, String?)? meaningTextControllerValidator;
  // State field(s) for MapHabitat widget.
  List<String>? mapHabitatValue;
  FormFieldController<List<String>>? mapHabitatValueController;
  // State field(s) for TextHabitat widget.
  FocusNode? textHabitatFocusNode;
  TextEditingController? textHabitatTextController;
  String? Function(BuildContext, String?)? textHabitatTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading_firestoreAddUploads = false;
  List<FFUploadedFile> uploadedLocalFiles_firestoreAddUploads = [];
  List<String> uploadedFileUrls_firestoreAddUploads = [];

  // Stores action output result for [Backend Call - Create Document] action in Save widget.
  PlantsRecord? addedPlantWithImgs;
  // Stores action output result for [Backend Call - Create Document] action in Save widget.
  PlantsRecord? addedPlantNoImgs;

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

    appearanceFocusNode?.dispose();
    appearanceTextController?.dispose();

    meaningFocusNode?.dispose();
    meaningTextController?.dispose();

    textHabitatFocusNode?.dispose();
    textHabitatTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
