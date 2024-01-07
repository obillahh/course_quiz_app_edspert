part of 'user_update_bloc.dart';

@immutable
sealed class UserUpdateState {}

final class UserUpdateInitial extends UserUpdateState {}

final class UserUpdateLoading extends UserUpdateState {}

final class UserUpdateSuccess extends UserUpdateState {
  final bool update;

  UserUpdateSuccess({required this.update});
}

final class UserUpdateFail extends UserUpdateState {
  final String message;

  UserUpdateFail({required this.message});
}
