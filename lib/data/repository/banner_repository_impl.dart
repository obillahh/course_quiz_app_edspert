import 'package:application_edspert/data/datasource/remote/banner_remote_datasource.dart';
import 'package:application_edspert/data/models/banner/banner_response_model.dart';
import 'package:application_edspert/domain/repository/banner_repository.dart';

import '../../domain/entity/banner/banner_response_entity.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource remoteDatasource;

  const BannerRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<BannerDataEntity>?> getBanners() async {
    BannerResponseModel bannerResponseModel =
        await remoteDatasource.getBanners();
    List<BannerDataModel>? bannerDataModel = bannerResponseModel.data;

    if (bannerDataModel != null) {
      List<BannerDataEntity> bannerData =
          List<BannerDataModel>.from(bannerDataModel)
              .map(
                (e) => BannerDataEntity(
                  eventImage: e.eventImage ?? '',
                ),
              )
              .toList();
      return bannerData;
    } else {
      return null;
    }
  }
}
