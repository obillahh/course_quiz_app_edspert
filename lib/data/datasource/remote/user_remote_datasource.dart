import 'dart:developer';

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
}
