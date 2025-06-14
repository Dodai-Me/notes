import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/notes_list.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String addNewNotes;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              addNewNotes = value;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Provider.of<NotesList>(
                context,
                listen: false,
              ).addNote(addNewNotes);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            child: Text('Add Note'),
          ),
        ],
      ),
    );
  }
}
