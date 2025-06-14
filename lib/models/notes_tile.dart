import 'package:flutter/material.dart';
import 'package:provider_practice/constants.dart';

class NotesTile extends StatelessWidget {
  const NotesTile({
    super.key,
    this.number,
    required this.text,
    this.onChanged,
    required this.isChanged,
    required this.onLongPress,
  });

  final int? number;
  final String text;
  final ValueChanged<bool?>? onChanged;
  final bool isChanged;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Text('$number', style: kNumberingStyle),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            decoration: isChanged ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(value: isChanged, onChanged: onChanged),
        onLongPress: onLongPress,
      ),
    );
  }
}
