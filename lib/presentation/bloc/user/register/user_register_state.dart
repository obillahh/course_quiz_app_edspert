part of 'user_register_bloc.dart';

@immutable
sealed class UserRegisterState {}

final class UserRegisterInitial extends UserRegisterState {}

final class UserRegisterLoading extends UserRegisterState {}

final class UserRegisterSuccess extends UserRegisterState {
  final bool register;

  UserRegisterSuccess({required this.register});
}

final class UserRegisterFail extends UserRegisterState {
  final String message;

  UserRegisterFail({required this.message});
}
