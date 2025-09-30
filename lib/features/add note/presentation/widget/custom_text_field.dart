import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    required this.controller,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.maxLines,
    this.style,
  });
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String? hint;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      cursorColor: Colors.white,
      style: style,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
        border: InputBorder.none,
      ),
    );
  }
}
