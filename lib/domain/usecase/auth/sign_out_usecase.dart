import 'package:application_edspert/domain/repository/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository repository;

  const SignOutUsecase({required this.repository});

  Future<bool> call() async => await repository.signOut();
}
