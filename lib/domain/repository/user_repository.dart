import 'package:application_edspert/data/models/user/user_register_request_model.dart';
import 'package:application_edspert/data/models/user/user_update_request_model.dart';

import '../entity/user/user_response_entity.dart';

abstract class UserRepository {
  Future<UserDataEntity?> getUser(String userEmail);

  Future<bool> registerUser({required UserRegisterRequestModel request});

  Future<bool> updateUser({required UserUpdateRequestModel request});
}
