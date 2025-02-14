import 'package:injectable/injectable.dart';

import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repo.dart';
@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
