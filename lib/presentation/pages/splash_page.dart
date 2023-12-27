import 'package:application_edspert/core/themes/app_colors.dart';
import 'package:application_edspert/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      context.read<AuthBloc>().add(CheckIsSignedInWithGoogleEvent());
      // context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        bool isResultOfCheckUserSignedInWithGoogle =
            (previous is CheckIsUserSignedInWithGoogleState &&
                    previous.isLoading == true) &&
                (current is CheckIsUserSignedInWithGoogleState &&
                    current.isLoading == false);
        bool isResultOfCheckUserRegistered =
            (previous is CheckIsUserRegisteredState &&
                    previous.isLoading == true) &&
                (current is CheckIsUserRegisteredState &&
                    current.isLoading == false);
        return isResultOfCheckUserSignedInWithGoogle ||
            isResultOfCheckUserRegistered;
      },
      listener: (context, state) {
        if (state is CheckIsUserSignedInWithGoogleState) {
          if (!state.isLoading) {
            if (state.isSignedIn) {
              context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
            } else {
              context.go('/login');
            }
          }
        }
        if (state is CheckIsUserRegisteredState) {
          bool isRegistered = state.isRegistered;
          if (!isRegistered) {
            context.go('/register');
          } else {
            context.go('/home');
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(
            'assets/images/logo_edspert.png',
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
