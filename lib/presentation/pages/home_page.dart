import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:application_edspert/presentation/widgets/banner_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_colors.dart';
import '../bloc/banner/banner_bloc.dart';
import '../bloc/course/course_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../widgets/card_course_tile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        backgroundColor: AppGrayscale.off,
        elevation: 0,
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai, ${state.user.userName}',
                    style: AppFonts.appFont.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppGrayscale.title,
                    ),
                  ),
                  Text(
                    'Selamat Datang',
                    style: AppFonts.appFont.titleSmall!.copyWith(
                      color: AppGrayscale.title,
                    ),
                  ),
                ],
              );
            } else if (state is UserErrorState) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        actions: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccessState) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.network(
                    state.user.userFoto,
                    width: 50.w,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/foto_image.png',
                        width: 40,
                      );
                    },
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Mau kerjain latihan soal apa hari ini?',
                      style: AppFonts.appFont.headlineSmall!.copyWith(
                        color: AppGrayscale.off,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/banner.png',
                      scale: 0.9,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pilih Pelajaran',
                        style: AppFonts.appFont.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/course');
                        },
                        child: Text(
                          'Lihat Semua',
                          style: AppFonts.appFont.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 300.h,
                    child: BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseSuccess) {
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return CardCourseTileWidget(
                                course: state.courses![index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 6.h,
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terbaru',
                    style: AppFonts.appFont.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 140.h,
                    child: BlocBuilder<BannerBloc, BannerState>(
                      builder: (context, state) {
                        if (state is BannerSuccessState) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return BannerContainerWidget(
                                  banner: state.banners[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10.w);
                            },
                            itemCount: state.banners.length,
                            scrollDirection: Axis.horizontal,
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
