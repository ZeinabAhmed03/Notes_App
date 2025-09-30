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
    this.note,
  });

  final Function()? onTap;
  final Function()? onPressed;
  final Function(String)? onChangedTitle;
  final TextEditingController titleController;
  final Function(String)? onChangedContent;
  final TextEditingController contentController;
  final FocusNode? focusNode;
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: NoteAppBar(
              controller: titleController,
              onPressed: onPressed,
              note: note,
              onChanged: onChangedTitle,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: contentController,
                onChanged: onChangedContent,
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
  }
}
