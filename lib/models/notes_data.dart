import 'package:hive/hive.dart';

part 'notes_data.g.dart';

@HiveType(typeId: 0)
class NotesData extends HiveObject {
  NotesData({this.number, required this.text, this.isChecked = false});

  @HiveField(0)
  int? number;

  @HiveField(1)
  String text;

  @HiveField(2)
  bool isChecked;

  void toggleCheckbox() {
    isChecked = !isChecked;
  }
}
