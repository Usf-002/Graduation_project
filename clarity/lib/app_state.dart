import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      _activityprogress = prefs
              .getStringList('ff_activityprogress')
              ?.map((path) => path.ref)
              .toList() ??
          _activityprogress;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool value) {
    _SearchActive = value;
  }

  List<DocumentReference> _activityprogress = [];
  List<DocumentReference> get activityprogress => _activityprogress;
  set activityprogress(List<DocumentReference> value) {
    _activityprogress = value;
    prefs.setStringList(
        'ff_activityprogress', value.map((x) => x.path).toList());
  }

  void addToActivityprogress(DocumentReference value) {
    _activityprogress.add(value);
    prefs.setStringList(
        'ff_activityprogress', _activityprogress.map((x) => x.path).toList());
  }

  void removeFromActivityprogress(DocumentReference value) {
    _activityprogress.remove(value);
    prefs.setStringList(
        'ff_activityprogress', _activityprogress.map((x) => x.path).toList());
  }

  void removeAtIndexFromActivityprogress(int index) {
    _activityprogress.removeAt(index);
    prefs.setStringList(
        'ff_activityprogress', _activityprogress.map((x) => x.path).toList());
  }

  void updateActivityprogressAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _activityprogress[index] = updateFn(_activityprogress[index]);
    prefs.setStringList(
        'ff_activityprogress', _activityprogress.map((x) => x.path).toList());
  }

  void insertAtIndexInActivityprogress(int index, DocumentReference value) {
    _activityprogress.insert(index, value);
    prefs.setStringList(
        'ff_activityprogress', _activityprogress.map((x) => x.path).toList());
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
