import 'package:application_edspert/data/models/user/user_update_request_model.dart';
import 'package:application_edspert/domain/repository/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository repository;

  UpdateUserUsecase({required this.repository});

  Future<bool> call(UserUpdateRequestModel requestModel) async =>
      await repository.updateUser(request: requestModel);
}
