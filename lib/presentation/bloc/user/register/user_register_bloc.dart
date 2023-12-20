import 'package:application_edspert/data/models/user/user_register_request_model.dart';
import 'package:application_edspert/domain/usecase/user/register_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final RegisterUserUsecase registerUserRepository;
  UserRegisterBloc({required this.registerUserRepository})
      : super(UserRegisterInitial()) {
    on<UserRegisterEvent>(
      (event, emit) async {
        if (event is RegisterUserEvent) {
          emit(UserRegisterLoading());
          final bool data = await registerUserRepository(event.request);
          emit(UserRegisterSuccess(register: data));
        }
      },
    );
  }
}
