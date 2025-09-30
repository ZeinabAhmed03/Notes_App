import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/Show%20Notes/presentation/widgets/notes_view_body.dart';
import 'package:notes_app/features/add%20note/presentation/view%20model/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/views/add_note_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.grey.shade700,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => BlocProvider(
                    create: (context) => AddNoteCubit(),
                    child: AddNoteView(),
                  ),
            ),
          );
        },
        child: Icon(Icons.edit_square, color: Colors.white),
      ),
      body: const NotesViewBody(),
    );
  }
}
