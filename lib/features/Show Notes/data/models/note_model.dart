import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String noteContent;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.noteTitle,
    required this.noteContent,
    required this.date,
    required this.color,
  });

  @override
  String toString() {
    return 'noteModel(noteTitle: $noteTitle, noteContent: $noteContent, data: $date, color: ${kColors.indexOf(Color(color))})';
  }
}
