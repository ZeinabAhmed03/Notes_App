import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/view%20model/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/widget/pop_scope_body.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late String title;
  late String content;
  NoteModel? noteModel;
  //bool isTitleChange = false;
  late FocusNode focusNode;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    focusNode = FocusNode();
    titleController = TextEditingController();
    contentController = TextEditingController();
    title = widget.note.noteTitle;
    content = widget.note.noteContent;
    titleController.text = widget.note.noteTitle;
    contentController.text = widget.note.noteContent;
    super.initState();
  }

  void requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  Future<void> isNoteChangedLogic(BuildContext context) async {
    bool isTitleChanged = titleController.text != widget.note.noteTitle;
    bool isContentChanged = contentController.text != widget.note.noteContent;

    if (isTitleChanged || isContentChanged) {
      widget.note.noteTitle = titleController.text;
      widget.note.noteContent = contentController.text;
      widget.note.date = DateFormat('MMM dd,yyyy').format(DateTime.now());
      widget.note.color = Colors.orange.shade100.toARGB32();

      await widget.note.save();
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
      onPopInvokedWithResult: (didPop, result) async {
        log('didPop value $didPop');
        if (didPop) {
          return;
        }
        return await isNoteChangedLogic(context);
      },
      child: PopScopeBody(
        //note: widget.note,
        // pageTitle: widget.pageTitle,
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
        onPressed: () async {
          await isNoteChangedLogic(context);
        },
        onTap: requestFocus,
        focusNode: focusNode,
      ),
    );
  }
}
