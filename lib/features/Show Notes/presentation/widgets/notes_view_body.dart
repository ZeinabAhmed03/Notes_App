import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/Show%20Notes/presentation/widgets/note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  late bool isSearching;
  late List<NoteModel> allNotes;
  late List<NoteModel> filteredNotes;
  late TextEditingController searchController;

  @override
  void initState() {
    loadNotes();
    isSearching = false;
    searchController = TextEditingController();
    searchController.addListener(searchLogic);
    super.initState();
  }

  void loadNotes() {
    allNotes = BlocProvider.of<FetchNotesCubit>(context).allNotes!;
    BlocProvider.of<FetchNotesCubit>(context).filteredNotes = List.from(
      allNotes,
    );
  }

  void searchLogic() {
    setState(() {
      String query = searchController.text;
      if (query.isEmpty) {
        BlocProvider.of<FetchNotesCubit>(context).filteredNotes = List.from(
          allNotes,
        );
      } else {
        filteredNotes =
            allNotes.where((note) {
              return note.noteContent.toLowerCase().contains(
                query.toLowerCase(),
              );
            }).toList();
        BlocProvider.of<FetchNotesCubit>(context).filteredNotes = filteredNotes;
        BlocProvider.of<FetchNotesCubit>(context).query = query;
        log(
          'filtered notes in when query is not empty: ${BlocProvider.of<FetchNotesCubit>(context).filteredNotes!.length}',
        );
      }
    });
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
        BlocProvider.of<FetchNotesCubit>(context).filteredNotes = List.from(
          allNotes,
        );
        BlocProvider.of<FetchNotesCubit>(context).query = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title:
              isSearching
                  ? SizedBox(
                    height: 50,
                    child: TextField(
                      autofocus: true,
                      controller: searchController,
                      cursorColor: Colors.white,
                      decoration: customInputDecoration(),
                    ),
                  )
                  : Text('Notes', style: TextStyle(fontSize: 25)),
          actions: [
            IconButton(
              onPressed: () {
                toggleSearch();
              },
              icon: Icon(
                isSearching ? Icons.close : Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),

        BlocBuilder<FetchNotesCubit, FetchNotesState>(
          builder: (context, state) {
            if (state is FetchNotesSuccess) {
              List<NoteModel> notes =
                  BlocProvider.of<FetchNotesCubit>(context).filteredNotes!;
              String query = BlocProvider.of<FetchNotesCubit>(context).query!;
              return notes.isNotEmpty
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
                            note: (notes.reversed.toList())[index],
                            query: query,
                          ),
                      itemCount: notes.length,
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

  InputDecoration customInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }
}
