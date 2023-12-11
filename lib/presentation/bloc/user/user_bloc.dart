import 'package:application_edspert/domain/entity/user/user_response_entity.dart';
import 'package:application_edspert/domain/usecase/user/get_user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUsecase getUserRepository;
  UserBloc({required this.getUserRepository}) : super(UserInitialState()) {
    on<UserEvent>(
      (event, emit) async {
        if (event is GetUserByEmailEvent) {
          emit(UserLoadingState());
          final UserDataEntity? data = await getUserRepository(event.email);
          if (data == null) {
            emit(UserErrorState(message: 'Something went wrong!'));
          } else {
            emit(UserSuccessState(user: data));
          }
        }
      },
    );
  }
}
