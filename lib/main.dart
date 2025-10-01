import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/features/Show%20Notes/data/models/note_model.dart';
import 'package:notes_app/features/Show%20Notes/presentation/view%20model/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/features/add%20note/presentation/view%20model/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes_app/features/splash/presentation/views/splash_view.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knoteBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchNotesCubit()..fetchNotes()),
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      //  create: (context) => FetchNotesCubit()..fetchNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
