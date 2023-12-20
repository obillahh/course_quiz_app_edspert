import 'dart:developer';

import 'package:application_edspert/data/models/user/user_register_request_model.dart';
import 'package:dio/dio.dart';

import '../../models/user/user_response_model.dart';

class UserRemoteDatasource {
  final Dio client;
  const UserRemoteDatasource({required this.client});

  Future<UserResponseModel> getUserByEmail(String userEmail) async {
    try {
      const url = "https://edspert.widyaedu.com/users";
      final result = await client.get(
        url,
        queryParameters: {
          "email": userEmail,
        },
        options: Options(
          headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"},
        ),
      );
      final userData = UserResponseModel.fromJson(result.data);
      return userData;
    } catch (e) {
      inspect('Error: $e');
      return UserResponseModel();
    }
  }

  Future<UserResponseModel> registerUser(
      {required UserRegisterRequestModel request}) async {
    try {
      const String url = 'https://edspert.widyaedu.com/users/registrasi';
      final result = await client.post(url,
          options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
          ),
          data: request.toMap());

      final userData = UserResponseModel.fromJson(result.data);
      inspect(userData.message);
      return userData;
    } catch (e) {
      inspect('Error: $e');
      return UserResponseModel();
    }
  }
}
