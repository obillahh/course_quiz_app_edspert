import 'package:application_edspert/data/models/user/user_register_request_model.dart';
import 'package:application_edspert/domain/repository/user_repository.dart';

class RegisterUserUsecase {
  final UserRepository repository;

  const RegisterUserUsecase({required this.repository});

  Future<bool> call(UserRegisterRequestModel request) async =>
      await repository.registerUser(request: request);
}
