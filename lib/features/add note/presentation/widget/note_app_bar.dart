import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/add%20note/presentation/view%20model/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/widget/alert_dialog.dart';
import 'package:notes_app/features/add%20note/presentation/widget/custom_text_field.dart';
import 'package:notes_app/features/add%20note/presentation/widget/color_item.dart';

class NoteAppBar extends StatefulWidget {
  const NoteAppBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onPressed,
    this.note,
  });
  final TextEditingController controller;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  final NoteModel? note;

  @override
  State<NoteAppBar> createState() => _NoteAppBarState();
}

class _NoteAppBarState extends State<NoteAppBar> {
  late bool isSelected;
  late bool isSameColor;
  late int selectedColor;
  late int storedColor;
  late List<Color> colors;
  late AddNoteCubit addNoteCubit;

  @override
  void initState() {
    isSelected = false;
    isSameColor = true;
    selectedColor = kColors[0].toARGB32();
    storedColor = BlocProvider.of<AddNoteCubit>(context).noteColor;
    colors = kColors;
    addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    super.initState();
  }

  void pickNoteColor(BuildContext context) {
    showPickColorDialog(context);
  }

  Future<dynamic> showPickColorDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (
            BuildContext context,
            void Function(void Function()) setState,
          ) {
            return AlertDialog(
              content: Text('Pick Note Color'),
              actions: [
                SizedBox(
                  height: 50,
                  width: 290,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      Color color = colors[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ColorItem(
                          selectedColor: selectedColor,
                          color: color,
                          onTap: () {
                            setState(() {
                              selectedColor = color.toARGB32();
                              if (selectedColor != storedColor) {
                                BlocProvider.of<AddNoteCubit>(context)
                                    .noteColor = selectedColor;
                                storedColor = selectedColor;
                              }
                              isSameColor = selectedColor == storedColor;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        Expanded(
          child: CustomTextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            hint: 'Title',
          ),
        ),
        Spacer(),
        if (widget.note != null)
          IconButton(
            onPressed: () {
              alertDialog(context, widget.note!);
            },
            icon: Icon(Icons.delete, color: Colors.white, size: 25),
          ),

        if (widget.note == null)
          SizedBox(
            height: 40,
            width: 40,
            child: InkWell(
              onTap: () {
                pickNoteColor(context);
              },
              child: Image.asset(kImagePath),
            ),
          ),
      ],
    );
  }
}
