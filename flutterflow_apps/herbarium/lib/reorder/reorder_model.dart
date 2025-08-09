import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reorder_widget.dart' show ReorderWidget;
import 'package:flutter/material.dart';

class ReorderModel extends FlutterFlowModel<ReorderWidget> {
  ///  Local state fields for this page.

  List<PlantsRecord> localListItems = [];
  void addToLocalListItems(PlantsRecord item) => localListItems.add(item);
  void removeFromLocalListItems(PlantsRecord item) =>
      localListItems.remove(item);
  void removeAtIndexFromLocalListItems(int index) =>
      localListItems.removeAt(index);
  void insertAtIndexInLocalListItems(int index, PlantsRecord item) =>
      localListItems.insert(index, item);
  void updateLocalListItemsAtIndex(
          int index, Function(PlantsRecord) updateFn) =>
      localListItems[index] = updateFn(localListItems[index]);

  bool listChanged = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<PlantsRecord>? updatedList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
