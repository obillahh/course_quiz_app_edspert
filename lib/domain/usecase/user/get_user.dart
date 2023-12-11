import '../../entity/user/user_response_entity.dart';
import '../../repository/user_repository.dart';

class GetUserUsecase {
  final UserRepository repository;

  GetUserUsecase({required this.repository});

  Future<UserDataEntity?> call(String email) async =>
      await repository.getUser(email);
}
