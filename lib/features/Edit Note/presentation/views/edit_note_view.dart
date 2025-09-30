import 'package:flutter/material.dart';
import 'package:notes_app/features/Edit%20Note/presentation/widgets/edit_note_view_body.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(note: note));
  }
}
