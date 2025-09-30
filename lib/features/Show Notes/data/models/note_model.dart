import 'package:hive_flutter/hive_flutter.dart';
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
}
