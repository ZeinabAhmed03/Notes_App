import 'package:flutter/material.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/add%20note/presentation/widget/alert_dialog.dart';
import 'package:notes_app/features/add%20note/presentation/widget/custom_text_field.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onPressed,
    // required this.pageTitle,
    this.note,
  });
  final TextEditingController controller;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  //final String? pageTitle;
  final NoteModel? note;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),

        Expanded(
          child: CustomTextField(
            controller: controller,
            onChanged: onChanged,
            hint: 'Title',
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            if (note != null) alertDialog(context, note!);
          },
          icon: Icon(Icons.delete, color: Colors.white, size: 25),
        ),
        //     if (pageTitle == 'Edit Note')
        //       Row(
        //         children: [
        //           IconButton(
        //             onPressed: () {
        //               if (note != null) alertDialog(context, note!);
        //             },
        //             icon: Icon(Icons.delete, color: Colors.white, size: 25),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               //alertDialog(context);
        //             },
        //             icon: Icon(Icons.edit, color: Colors.white, size: 25),
        //           ),
        //         ],
        //       ),
      ],
    );
  }
}
