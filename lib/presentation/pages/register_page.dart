import 'dart:developer';

import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:application_edspert/presentation/bloc/auth/auth_bloc.dart';
import 'package:application_edspert/presentation/bloc/user/register/user_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_colors.dart';
import '../../data/models/user/user_register_request_model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameUserController = TextEditingController();
  final TextEditingController _nameSchoolController = TextEditingController();

  String _radioButtonValue = "";
  String _dropdownButtonValue = "";

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() {
    _emailController.text =
        context.read<AuthBloc>().getCurrentSignedInEmailUsecase() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppGrayscale.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: AppGrayscale.off,
          foregroundColor: AppGrayscale.title,
          elevation: 3.0.r, // Add elevation here
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Text(
            'Yuk isi data diri',
            style: AppFonts.appFont.headlineSmall!.copyWith(
              color: AppGrayscale.title,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: AppFonts.appFont.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: AppGrayscale.off,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          hintText: 'contoh: Ihsanadi08@gmail.com',
                          hintStyle: AppFonts.appFont.bodySmall!.copyWith(
                            color: AppGrayscale.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: AppFonts.appFont.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        controller: _nameUserController,
                        decoration: InputDecoration(
                          fillColor: AppGrayscale.off,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          hintText: 'contoh : Ihsan Adireja',
                          hintStyle: AppFonts.appFont.bodySmall!.copyWith(
                            color: AppGrayscale.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: AppFonts.appFont.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: 'Laki-Laki',
                              groupValue: _radioButtonValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioButtonValue = value!;
                                });
                              },
                              dense: true,
                              contentPadding: EdgeInsets.all(0.0.r),
                              title: const Text('Laki-Laki'),
                              tileColor: AppGrayscale.off,
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: const BorderSide(
                                  color: AppGrayscale.placeholder,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: RadioListTile(
                              value: 'Perempuan',
                              groupValue: _radioButtonValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioButtonValue = value!;
                                });
                              },
                              dense: true,
                              contentPadding: EdgeInsets.all(0.0.r),
                              title: const Text('Perempuan'),
                              tileColor: AppGrayscale.off,
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: const BorderSide(
                                  color: AppGrayscale.placeholder,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kelas',
                        style: AppFonts.appFont.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      DropdownButtonFormField(
                        value: _dropdownButtonValue,
                        items: [
                          DropdownMenuItem(
                            value: _dropdownButtonValue,
                            child: Text(
                              'Pilih Kelas',
                              style: AppFonts.appFont.bodySmall!.copyWith(
                                color: AppGrayscale.label,
                              ),
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'X',
                            child: Text('X'),
                          ),
                          const DropdownMenuItem(
                            value: 'XI',
                            child: Text('XI'),
                          ),
                          const DropdownMenuItem(
                            value: 'XII',
                            child: Text('XII'),
                          ),
                        ],
                        onChanged: (value) {
                          _dropdownButtonValue = value!;
                        },
                        decoration: InputDecoration(
                          fillColor: AppGrayscale.off,
                          filled: true,
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Sekolah',
                        style: AppFonts.appFont.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextFormField(
                        controller: _nameSchoolController,
                        decoration: InputDecoration(
                          fillColor: AppGrayscale.off,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: const BorderSide(
                              color: AppGrayscale.placeholder,
                            ),
                          ),
                          hintText: 'contoh: SMK Telkom Malang',
                          hintStyle: AppFonts.appFont.bodySmall!.copyWith(
                            color: AppGrayscale.label,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocListener<UserRegisterBloc, UserRegisterState>(
            listener: (context, state) {
              if (state is UserRegisterSuccess) {
                if (state.register) {
                  inspect(state.register);
                  context.go('/home');
                } else {
                  inspect('gagal regis');
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<UserRegisterBloc>().add(
                        RegisterUserEvent(
                          request: UserRegisterRequestModel(
                            userName: _nameUserController.text,
                            userEmail: _emailController.text,
                            userGender: _radioButtonValue,
                            kelas: _dropdownButtonValue,
                            userAsalSekolah: _nameSchoolController.text,
                          ),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(48.h),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                child: Text(
                  'Daftar',
                  style: AppFonts.appFont.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
