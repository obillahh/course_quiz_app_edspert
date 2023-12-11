import '../entity/user/user_response_entity.dart';

abstract class UserRepository {
  Future<UserDataEntity?> getUser(String userEmail);
}
