import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/screens/home_screen.dart';
import 'provider/notes_list.dart';
import 'models/notes_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NotesDataAdapter());
  await Hive.openBox<NotesData>('notesBox');

  final notesList = NotesList();
  await notesList.init();

  runApp(ChangeNotifierProvider.value(value: notesList, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final myTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black45,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: HomeScreen(),
    );
  }
}
