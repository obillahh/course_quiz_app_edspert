part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserSuccessState extends UserState {
  final UserDataEntity user;

  UserSuccessState({required this.user});
}

final class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}
