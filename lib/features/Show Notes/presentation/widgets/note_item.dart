import 'package:flutter/material.dart';
import 'package:notes_app/features/Edit%20Note/presentation/views/edit_note_view.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:substring_highlight/substring_highlight.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, required this.query});
  final NoteModel note;
  final String query;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
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
                color: Color(note.color),
              ),
              child: Center(
                child:
                    query.isEmpty
                        ? Text(
                          note.noteContent,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        )
                        : SubstringHighlight(
                          text: note.noteContent,
                          term: query,
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
