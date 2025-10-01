import 'package:flutter/material.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/widgets/note_item.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key, required this.notes, required this.query});
  final List<NoteModel> notes;
  final String query;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 300,
      ),
      itemBuilder:
          (context, index) =>
              NoteItem(note: (notes.reversed.toList())[index], query: query),
      itemCount: notes.length,
    );
  }
}
