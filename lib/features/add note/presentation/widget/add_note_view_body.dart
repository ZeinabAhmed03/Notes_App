import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/view%20model/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/widget/pop_scope_body.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key, this.note});
  final NoteModel? note;
  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  String title = 'No Title';
  String content = '';
  dynamic noteModel;
  late FocusNode focusNode;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    focusNode = FocusNode();
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  void requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void saveNoteLogic(BuildContext context) {
    bool isNoteSaved =
        titleController.text.isEmpty && contentController.text.isEmpty;

    if (!isNoteSaved) {
      noteModel = NoteModel(
        noteTitle: titleController.text.isEmpty ? title : titleController.text,
        noteContent: contentController.text,
        date: DateFormat('MMM dd,yyyy').format(DateTime.now()),
        color: Colors.orange.shade100.toARGB32(),
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
      BlocProvider.of<FetchNotesCubit>(context).fetchNotes();
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        log('didPop value $didPop');
        if (didPop) {
          return;
        }
        return saveNoteLogic(context);
      },
      child: PopScopeBody(
        note: widget.note,
        titleController: titleController,
        contentController: contentController,
        onChangedContent: (value) {
          content = value;
          log(content);
        },
        onChangedTitle: (value) {
          title = value;
          log(title);
        },
        onPressed: () {
          saveNoteLogic(context);
        },
        onTap: requestFocus,
        focusNode: focusNode,
      ),
    );
  }
}
