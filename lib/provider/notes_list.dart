import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider_practice/models/notes_data.dart';
import 'package:hive/hive.dart';

class NotesList extends ChangeNotifier {
  List<NotesData> _noteItems = [];

  UnmodifiableListView<NotesData> get listId =>
      UnmodifiableListView(_noteItems);

  int get listLength => _noteItems.length;

  late Box<NotesData> _noteBox;

  Future<void> init() async {
    _noteBox = Hive.box<NotesData>('notesBox');
    _noteItems = _noteBox.values.toList();
    notifyListeners();
  }

  void addNote(String notes) {
    final note = NotesData(number: listLength + 1, text: notes);
    _noteItems.add(note);
    _noteBox.add(note);
    notifyListeners();
  }

  void checkNotes(NotesData note) {
    note.toggleCheckbox();
    note.save();
    notifyListeners();
  }

  void deleteNotes(NotesData note) {
    _noteItems.remove(note);
    _noteBox.delete(note);
    notifyListeners();
  }

  void deleteAllNotes() async {
    await _noteBox.clear();
    _noteItems.clear();
    notifyListeners();
  }
}
