import 'package:flutter/material.dart';
import 'package:notes_app/features/Edit%20Note/presentation/views/edit_note_view.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/add%20note/presentation/views/add_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                //pageTitle: 'Edit Note',
                note: note,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.orange.shade100,
              ),
              child: Center(
                child: Text(
                  note.noteContent,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Text(note.noteTitle),
          Text(note.date, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
