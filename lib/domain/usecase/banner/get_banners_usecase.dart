import 'package:application_edspert/domain/entity/banner/banner_response_entity.dart';

import '../../repository/banner_repository.dart';

class GetBannersUsecase {
  final BannerRepository repository;

  const GetBannersUsecase({required this.repository});

  Future<List<BannerDataEntity>?> call() async => await repository.getBanners();
}
