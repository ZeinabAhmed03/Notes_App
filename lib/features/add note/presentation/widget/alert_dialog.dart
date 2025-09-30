import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/Show%20Notes/presentation/views/notes_view.dart';

Future<dynamic> alertDialog(BuildContext context, NoteModel note) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Text(
          'Are you sure, You want to delete Note',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await onPressedYesLogic(note, context);
            },
            child: Text('Yes', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No', style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );
}

Future<void> onPressedYesLogic(NoteModel note, BuildContext context) async {
  await note.delete();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return NotesView();
      },
    ),
  );
  BlocProvider.of<FetchNotesCubit>(context).fetchNotes();
}
