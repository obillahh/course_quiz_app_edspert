part of 'user_update_bloc.dart';

@immutable
sealed class UserUpdateEvent {}

class UpdateUserEvent extends UserUpdateEvent {
  final UserUpdateRequestModel request;

  UpdateUserEvent({required this.request});
  
}