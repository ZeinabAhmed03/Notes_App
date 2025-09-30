import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/Show%20Notes/presentation/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Notes', style: TextStyle(fontSize: 25)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 30, color: Colors.white),
            ),
          ],
        ),

        BlocBuilder<FetchNotesCubit, FetchNotesState>(
          builder: (context, state) {
            if (state is FetchNotesSuccess) {
              return state.notes.isNotEmpty
                  ? Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 300,
                      ),
                      itemBuilder:
                          (context, index) => NoteItem(
                            note: (state.notes.reversed.toList())[index],
                          ),
                      itemCount: state.notes.length,
                    ),
                  )
                  : Center(
                    child: Text('No notes found, Create your first note'),
                  );
            }
            return Center(child: Text('There is an error, try later'));
          },
        ),
      ],
    );
  }
}
