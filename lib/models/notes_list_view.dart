import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/notes_list.dart';
import 'package:provider_practice/models/notes_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesList>(
      builder: (_, notesList, __) => ListView.builder(
        itemCount: Provider.of<NotesList>(context).listLength,
        itemBuilder: (context, index) {
          final note = notesList.listId[index];
          return NotesTile(
            number: note.number,
            text: note.text,
            isChanged: note.isChecked,
            onChanged: (value) {
              Provider.of<NotesList>(context, listen: false).checkNotes(note);
            },
            onLongPress: () {
              Provider.of<NotesList>(context, listen: false).deleteNotes(note);
            },
          );
        },
      ),
    );
  }
}
