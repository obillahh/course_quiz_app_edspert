import 'package:application_edspert/core/themes/app_colors.dart';
import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/user/user_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text(
          'Akun Saya',
          style: AppFonts.appFont.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: AppFonts.appFont.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppGrayscale.off,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccessState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.userName,
                                style: AppFonts.appFont.titleLarge!.copyWith(
                                  color: AppGrayscale.off,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                state.user.userAsalSekolah,
                                style: AppFonts.appFont.bodySmall!.copyWith(
                                  color: AppGrayscale.off,
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                            state.user.userFoto,
                            scale: 3.r,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/foto_image.png',
                                scale: 3.r,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppGrayscale.off,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppGrayscale.title.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccessState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Identitas Diri',
                          style: AppFonts.appFont.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Lengkap',
                              style: AppFonts.appFont.bodyMedium!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                            Text(
                              state.user.userName,
                              style: AppFonts.appFont.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: AppFonts.appFont.bodyMedium!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                            Text(
                              state.user.userEmail,
                              style: AppFonts.appFont.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis Kelamin',
                              style: AppFonts.appFont.bodyMedium!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                            Text(
                              state.user.userGender,
                              style: AppFonts.appFont.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kelas',
                              style: AppFonts.appFont.bodyMedium!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                            Text(
                              state.user.kelas,
                              style: AppFonts.appFont.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sekolah',
                              style: AppFonts.appFont.bodyMedium!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                            Text(
                              state.user.userAsalSekolah,
                              style: AppFonts.appFont.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppGrayscale.title.withOpacity(
                      0.25,
                    ), // Adjust the color and opacity as needed
                    offset: const Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppGrayscale.off,
                  elevation: 0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: AppColors.error,
                      ),
                      Text(
                        'Keluar',
                        style: AppFonts.appFont.titleMedium!.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
