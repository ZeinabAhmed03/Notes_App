part of 'fetch_notes_cubit.dart';

@immutable
sealed class FetchNotesState {}

final class FetchNotesInitial extends FetchNotesState {}

final class FetchNotesSuccess extends FetchNotesState {
  final List<NoteModel> notes;

  FetchNotesSuccess({required this.notes});
}
