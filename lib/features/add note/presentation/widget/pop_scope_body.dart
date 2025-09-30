import 'package:flutter/material.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/add%20note/presentation/widget/custom_text_field.dart';
import 'package:notes_app/features/add%20note/presentation/widget/note_app_bar.dart';

class PopScopeBody extends StatelessWidget {
  const PopScopeBody({
    super.key,
    this.onTap,
    this.onPressed,
    this.onChangedTitle,
    required this.titleController,
    this.onChangedContent,
    required this.contentController,
    this.focusNode,
    //   this.pageTitle,
    this.note,
  });

  final Function()? onTap;
  final Function()? onPressed;
  final Function(String)? onChangedTitle;
  final TextEditingController titleController;
  final Function(String)? onChangedContent;
  final TextEditingController contentController;
  final FocusNode? focusNode;
  //final String? pageTitle;
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    //  bool isTitleChanged = false;
    //  bool isContentChanged = false;
    // if(note != null) {
    // isTitleChanged = titleController.text == note!.noteTitle;
    // isContentChanged = contentController.text == note!.noteContent;
    // }
    return GestureDetector(
      onTap: onTap,
      //requestFocus,
      child: Column(
        children: [
          SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: NoteAppBar(
              controller: titleController,
              onPressed: onPressed,
              //pageTitle: pageTitle,
              note: note,
              //  () {
              //   saveNoteLogic(context);
              // },
              onChanged: onChangedTitle,
              //  (value) {
              //   title = value;
              //   log(title);
              // },
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: contentController,
                onChanged: onChangedContent,

                // (value) {
                //   content = value;
                //   log(content);
                // },
                focusNode: focusNode,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
