import 'package:application_edspert/presentation/widgets/button_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Login',
                      style: AppFonts.appFont.headlineMedium,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo_login.svg',
                        width: 360.w,
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        'Selamat Datang',
                        style: AppFonts.appFont.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                        style: AppFonts.appFont.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonLoginWidget(
                    bgColor: Colors.white,
                    image: 'assets/images/google_logo.png',
                    text: 'Login with Google',
                    textColor: Colors.black,
                    borderColor: const Color(0xff01B1AF),
                    onTap: () {
                      context.go('/home');
                    },
                  ),
                  SizedBox(height: 20.h),
                  ButtonLoginWidget(
                    bgColor: Colors.black,
                    image: 'assets/images/apple_logo.png',
                    text: 'Login with Apple',
                    textColor: Colors.white,
                    borderColor: Colors.black,
                    onTap: () {},
                  ),
                  SizedBox(height: 50.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
