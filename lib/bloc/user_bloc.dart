import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/psssa_service.dart';
import '../models/models.dart';

// Event
@immutable
sealed class UserEvent {}

final class FetchUser extends UserEvent {}

// States
@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  final User user;
  final String token;

  UserLoaded(
    this.user,
    this.token,
  );
}

final class UserError extends UserState {
  final String message;
  UserError(
    this.message,
  );
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUser>((event, emit) async {
      try {
        final user = await PsssaService().getCurrentUser();
        emit(
          UserLoaded(
            user[0],
            user[1],
          ),
        );
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
