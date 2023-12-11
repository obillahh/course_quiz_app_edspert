part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitialState extends BannerState {}

final class BannerLoadingState extends BannerState {}

final class BannerSuccessState extends BannerState {
  final List<BannerDataEntity> banners;

  BannerSuccessState({required this.banners});
}

final class BannerFailState extends BannerState {
  final String message;

  BannerFailState({required this.message});
}
