import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:application_edspert/domain/entity/banner/banner_response_entity.dart';
import 'package:application_edspert/domain/usecase/banner/get_banners_usecase.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUsecase getBannersUsecase;
  BannerBloc({required this.getBannersUsecase}) : super(BannerInitialState()) {
    on<BannerEvent>(
      (event, emit) async {
        if (event is GetBannersEvent) {
          emit(BannerLoadingState());
          final List<BannerDataEntity>? data = await getBannersUsecase();
          if (data == null) {
            emit(BannerFailState(message: 'Something went wrong!'));
          } else {
            emit(BannerSuccessState(banners: data));
          }
        }
      },
    );
  }
}
