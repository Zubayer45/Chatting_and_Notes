import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveLocalStorage with ChangeNotifier {
  List<Map<String, dynamic>> _noteList = [];
  List<Map<String, dynamic>> get noteList => _noteList;
  final notesBox = Hive.box('notes');
  addNoteHive(Map<String, dynamic> addItem) async {
    await notesBox.add(addItem);

    refreshData();
  }

  void refreshData() {
    final data = notesBox.keys.map((key) {
      final item = notesBox.get(key);
      return {
        "key": key,
        "noteText": item['noteText'],
        "dateTime": item['dateTime'],
       // "location": item['location']
      };
    }).toList();
    _noteList = data.toList();

    notifyListeners();
  }
}
