import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:application_edspert/domain/usecase/user/update_user_usecase.dart';

import '../../../../data/models/user/user_update_request_model.dart';

part 'user_update_event.dart';
part 'user_update_state.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  final UpdateUserUsecase updateUserUsecase;
  UserUpdateBloc({required this.updateUserUsecase})
      : super(UserUpdateInitial()) {
    on<UserUpdateEvent>(
      (event, emit) async {
        if (event is UpdateUserEvent) {
          emit(UserUpdateLoading());
          final bool data = await updateUserUsecase(event.request);
          emit(UserUpdateSuccess(update: data));
        }
      },
    );
  }
}
