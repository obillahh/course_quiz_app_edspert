import 'package:application_edspert/domain/usecase/auth/get_current_signed_in_email_usecase.dart';
import 'package:application_edspert/domain/usecase/auth/is_signed_in_with_google_usecase.dart';
import 'package:application_edspert/domain/usecase/auth/is_user_registered_usecase.dart';
import 'package:application_edspert/domain/usecase/auth/sign_in_with_google_usecase.dart';
import 'package:application_edspert/domain/usecase/auth/sign_out_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final GetCurrentSignedInEmailUsecase getCurrentSignedInEmailUsecase;
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final IsUserRegisteredUsecase isUserRegisteredUsecase;
  final SignOutUsecase signOutUsecase;
  AuthBloc(
    this.signInWithGoogleUsecase,
    this.getCurrentSignedInEmailUsecase,
    this.isSignedInWithGoogleUsecase,
    this.isUserRegisteredUsecase,
    this.signOutUsecase,
  ) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is SignInWithGoogleEvent) {
          emit(SignInWithGoogleState(
            result: null,
            isLoading: true,
          ));
          final User? user = await signInWithGoogleUsecase();
          emit(SignInWithGoogleState(
            result: user,
            isLoading: false,
          ));
        }
        if (event is CheckIsSignedInWithGoogleEvent) {
          emit(CheckIsUserSignedInWithGoogleState(
            isSignedIn: false,
            isLoading: true,
          ));

          bool isSignedIn = isSignedInWithGoogleUsecase();

          if (isSignedIn) {
            emit(CheckIsUserSignedInWithGoogleState(
              isSignedIn: isSignedIn,
              isLoading: false,
            ));
          } else {
            emit(CheckIsUserSignedInWithGoogleState(
              isSignedIn: isSignedIn,
              isLoading: false,
            ));
          }
        }
        if (event is CheckIsUserRegisteredEvent) {
          emit(CheckIsUserRegisteredState(
            isRegistered: false,
            isLoading: true,
          ));

          bool isRegistered = await isUserRegisteredUsecase();

          emit(CheckIsUserRegisteredState(
            isRegistered: isRegistered,
            isLoading: false,
          ));
        }

        if (event is SignOutEvent) {
          emit(SignOutState(
            signOut: false,
            isLoading: true,
          ));

          bool signOut = await signOutUsecase();

          emit(SignOutState(
            signOut: signOut,
            isLoading: false,
          ));
        }
      },
    );
  }
  String? getCurrentSignedInEmail() {
    return getCurrentSignedInEmailUsecase();
  }
}
