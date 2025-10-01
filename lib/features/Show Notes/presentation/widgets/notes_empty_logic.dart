import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class NotesEmptyLogic extends StatelessWidget {
  const NotesEmptyLogic({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          query.isEmpty
              ? Text('No notes found, Create your first note')
              : SubstringHighlight(
                textStyle: const TextStyle(color: Colors.white),
                text: 'No notes found match $query',
                term: query,
              ),
    );
  }
}
