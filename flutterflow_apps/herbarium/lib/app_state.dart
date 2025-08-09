import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _polishNames = prefs.getBool('ff_polishNames') ?? _polishNames;
    });
    _safeInit(() {
      _uploadImage = prefs.getString('ff_uploadImage') ?? _uploadImage;
    });
    _safeInit(() {
      _addBtnOnTop = prefs.getBool('ff_addBtnOnTop') ?? _addBtnOnTop;
    });
    _safeInit(() {
      _greenTitles = prefs.getBool('ff_greenTitles') ?? _greenTitles;
    });
    _safeInit(() {
      _mapHabitat = prefs.getBool('ff_mapHabitat') ?? _mapHabitat;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _polishNames = true;
  bool get polishNames => _polishNames;
  set polishNames(bool value) {
    _polishNames = value;
    prefs.setBool('ff_polishNames', value);
    notifyListeners();
  }

  String _uploadImage = '';
  String get uploadImage => _uploadImage;
  set uploadImage(String value) {
    _uploadImage = value;
    prefs.setString('ff_uploadImage', value);
    notifyListeners();
  }

  bool _addBtnOnTop = true;
  bool get addBtnOnTop => _addBtnOnTop;
  set addBtnOnTop(bool value) {
    _addBtnOnTop = value;
    prefs.setBool('ff_addBtnOnTop', value);
    notifyListeners();
  }

  bool _greenTitles = false;
  bool get greenTitles => _greenTitles;
  set greenTitles(bool value) {
    _greenTitles = value;
    prefs.setBool('ff_greenTitles', value);
    notifyListeners();
  }

  bool _dedykacja = false;
  bool get dedykacja => _dedykacja;
  set dedykacja(bool value) {
    _dedykacja = value;
    notifyListeners();
  }

  bool _mapHabitat = true;
  bool get mapHabitat => _mapHabitat;
  set mapHabitat(bool value) {
    _mapHabitat = value;
    prefs.setBool('ff_mapHabitat', value);
    notifyListeners();
  }

  List<String> _emptySet = [];
  List<String> get emptySet => _emptySet;
  set emptySet(List<String> value) {
    _emptySet = value;
    notifyListeners();
  }

  void addToEmptySet(String value) {
    emptySet.add(value);
    notifyListeners();
  }

  void removeFromEmptySet(String value) {
    emptySet.remove(value);
    notifyListeners();
  }

  void removeAtIndexFromEmptySet(int index) {
    emptySet.removeAt(index);
    notifyListeners();
  }

  void updateEmptySetAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptySet[index] = updateFn(_emptySet[index]);
    notifyListeners();
  }

  void insertAtIndexInEmptySet(int index, String value) {
    emptySet.insert(index, value);
    notifyListeners();
  }

  bool _dedykacjaVis = false;
  bool get dedykacjaVis => _dedykacjaVis;
  set dedykacjaVis(bool value) {
    _dedykacjaVis = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
