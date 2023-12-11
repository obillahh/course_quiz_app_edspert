import 'dart:developer';

import 'package:application_edspert/data/models/banner/banner_response_model.dart';
import 'package:dio/dio.dart';

class BannerRemoteDatasource {
  final Dio client;

  const BannerRemoteDatasource({required this.client});

  Future<BannerResponseModel> getBanners() async {
    try {
      const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final result = await client.get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final bannerData = BannerResponseModel.fromJson(result.data);
      return bannerData;
    } catch (e) {
      inspect('Error: $e');
      return BannerResponseModel();
    }
  }
}
