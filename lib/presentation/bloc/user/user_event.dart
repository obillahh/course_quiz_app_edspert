part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUserByEmailEvent extends UserEvent  {
  final String email;

  GetUserByEmailEvent({required this.email});
}
