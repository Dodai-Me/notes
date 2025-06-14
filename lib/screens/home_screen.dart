import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/models/notes_list_view.dart';
import 'package:provider_practice/provider/notes_list.dart';
import 'package:provider_practice/screens/add_notes_screen.dart';
import 'package:provider_practice/screens/settings_screen.dart';
import 'package:provider_practice/screens/project_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final note = Provider.of<NotesList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.note_add_sharp),
            SizedBox(width: 5),
            Text('Notes'),
          ],
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 10),
                    Text('Settings', style: TextStyle(fontSize: 20)),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.dataset),
                    SizedBox(width: 10),
                    Text('Projects', style: TextStyle(fontSize: 20)),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Projects()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                note.deleteAllNotes();
              },
              shape: CircleBorder(),
              child: Icon(Icons.delete),
            ),
            FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddNotesScreen(),
                    ),
                  ),
                );
              },
              shape: CircleBorder(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: note.listLength == 0
            ? Center(
                child: Text(
                  'No notes available',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : NotesListView(),
      ),
    );
  }
}
