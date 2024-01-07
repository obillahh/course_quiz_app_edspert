import 'dart:developer';
import 'dart:io';

import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:application_edspert/data/models/user/user_update_request_model.dart';
import 'package:application_edspert/presentation/bloc/user/user_update/user_update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_grayscale.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/user/user_bloc.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameUserController = TextEditingController();
  final TextEditingController _nameSchoolController = TextEditingController();

  String _genderValue = "";
  String _classValue = "";

  File? _photoFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        title: Text(
          'Edit Akun',
          style: AppFonts.appFont.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Diri',
                style: AppFonts.appFont.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Ambil dari Galeri'),
                            onTap: () async {
                              Navigator.pop(context);
                              XFile? pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _photoFile = File(pickedFile.path);
                                });
                              }
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Ambil Foto'),
                            onTap: () async {
                              Navigator.pop(context);
                              XFile? pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                setState(
                                  () {
                                    _photoFile = File(pickedFile.path);
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Center(
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/foto_image.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: _photoFile != null
                        ? ClipOval(
                            child: SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: Image.file(
                                _photoFile!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: SizedBox(
                              width: 100.w,
                              height: 100.h,
                              child: Image.asset(
                                'assets/images/foto_image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                controller: _nameUserController,
                cursorColor: AppGrayscale.label,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  labelText: 'Name Lengkap',
                  labelStyle: TextStyle(
                    color: AppGrayscale.label,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _emailController,
                cursorColor: AppGrayscale.label,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: AppGrayscale.label,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              DropdownButtonFormField(
                value: _genderValue,
                items: [
                  DropdownMenuItem(
                    value: "",
                    child: Text(
                      'Jenis Kelamin',
                      style: AppFonts.appFont.bodyLarge!.copyWith(
                        color: AppGrayscale.label,
                      ),
                    ),
                  ),
                  const DropdownMenuItem(
                    value: 'Laki-Laki',
                    child: Text('Laki-Laki'),
                  ),
                  const DropdownMenuItem(
                    value: 'Perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
                onChanged: (value) {
                  _genderValue = value!;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              DropdownButtonFormField(
                value: _classValue,
                items: [
                  DropdownMenuItem(
                    value: "",
                    child: Text(
                      'Kelas',
                      style: AppFonts.appFont.bodyLarge!.copyWith(
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
                  _classValue = value!;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: _nameSchoolController,
                cursorColor: AppGrayscale.label,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppGrayscale.label,
                    ),
                  ),
                  labelText: 'Sekolah',
                  labelStyle: TextStyle(
                    color: AppGrayscale.label,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              BlocListener<UserUpdateBloc, UserUpdateState>(
                listener: (context, state) {
                  if (state is UserUpdateSuccess) {
                    if (!state.update) {
                      context.read<UserBloc>().add(GetUserByEmailEvent(
                          email: context
                              .read<AuthBloc>()
                              .getCurrentSignedInEmailUsecase()!));
                      context.go('/profile');
                    } else {
                      inspect('gagal update');
                    }
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    context.read<UserUpdateBloc>().add(
                          UpdateUserEvent(
                            request: UserUpdateRequestModel(
                              namaLengkap: _nameUserController.text,
                              email: _emailController.text,
                              gender: _genderValue,
                              kelas: _classValue,
                              namaSekolah: _nameSchoolController.text,
                              foto: _photoFile!.path,
                            ),
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    minimumSize: Size(double.infinity.w, 40.h),
                  ),
                  child: const Text('Perbarui Data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
