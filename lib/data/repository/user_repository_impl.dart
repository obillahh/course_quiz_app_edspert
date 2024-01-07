import 'package:application_edspert/data/datasource/remote/user_remote_datasource.dart';
import 'package:application_edspert/data/models/user/user_register_request_model.dart';
import 'package:application_edspert/data/models/user/user_update_request_model.dart';
import 'package:application_edspert/domain/entity/user/user_response_entity.dart';
import 'package:application_edspert/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;
  UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<UserDataEntity?> getUser(String userEmail) async {
    final response = await remoteDatasource.getUserByEmail(userEmail);
    if (response.data == null) {
      return null;
    }
    final data = UserDataEntity(
      iduser: response.data?.iduser ?? '',
      userName: response.data?.userName ?? '',
      userEmail: response.data?.userEmail ?? '',
      userFoto: response.data?.userFoto ?? '',
      userAsalSekolah: response.data?.userAsalSekolah ?? '',
      dateCreate: response.data?.dateCreate ?? DateTime.now(),
      jenjang: response.data?.jenjang ?? '',
      userGender: response.data?.userGender ?? '',
      userStatus: response.data?.userStatus ?? '',
      kelas: response.data?.kelas ?? '',
    );
    return data;
  }

  @override
  Future<bool> registerUser({required UserRegisterRequestModel request}) async {
    final response = await remoteDatasource.registerUser(request: request);

    if (response.message == 'ok') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> updateUser({required UserUpdateRequestModel request}) async {
    final response = await remoteDatasource.updateUser(request: request);

    if (response.message == 'ok') {
      return true;
    } else {
      return false;
    }
  }
}
