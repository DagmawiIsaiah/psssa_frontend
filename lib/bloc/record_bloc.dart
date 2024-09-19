import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/psssa_service.dart';
import '../models/models.dart';

// Event
@immutable
sealed class RecordEvent {}

final class FetchRecords  extends RecordEvent{}

// States
@immutable
sealed class RecordState {}

final class RecordInitial extends RecordState {}

final class RecordLoading extends RecordState {}

final class RecordLoaded extends RecordState {
  final List<Record> records;
  RecordLoaded(
    this.records,
  );
}

final class RecordError extends RecordState {
  final String message;
  RecordError(
    this.message,
  );
}

// Bloc
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc() : super(RecordInitial()) {
    on<FetchRecords>((event, emit) async {
      emit(RecordLoading());

      try {
        final record = await PsssaService().fetchRecords();
        emit(RecordLoaded(record));
      } catch (e) {
        emit(RecordError(e.toString()));
      }
    });
  }
}
