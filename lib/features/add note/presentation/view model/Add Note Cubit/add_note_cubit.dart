import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int noteColor = kColors[0].toARGB32();
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    var noteBox = Hive.box<NoteModel>(knoteBox);
    await noteBox.add(note);
    log('${noteBox.values.toList()}');
    emit(AddNoteSuccess());
  }
}
