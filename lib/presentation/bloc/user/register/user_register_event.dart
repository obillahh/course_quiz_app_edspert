part of 'user_register_bloc.dart';

@immutable
sealed class UserRegisterEvent {}

class RegisterUserEvent extends UserRegisterEvent {
  final UserRegisterRequestModel request;

  RegisterUserEvent({required this.request});
}