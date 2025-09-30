import 'package:flutter/material.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/add%20note/presentation/widget/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
    //this.pageTitle = '',
    this.note,
  });
  //final String? pageTitle;
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddNoteViewBody(
        //pageTitle: pageTitle,
        note: note,
      ),
    );
  }
}
