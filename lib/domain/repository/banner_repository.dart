import 'package:application_edspert/domain/entity/banner/banner_response_entity.dart';

abstract class BannerRepository {
  Future<List<BannerDataEntity>?> getBanners();
}
