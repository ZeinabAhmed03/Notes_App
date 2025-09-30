import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());

  void fetchNotes() {
    var notesBox = Hive.box<NoteModel>(knoteBox);
    List<NoteModel> notes = notesBox.values.toList();
    log('there is ${notes.length} note in the box');
    emit(FetchNotesSuccess(notes: notes));
  }
}
