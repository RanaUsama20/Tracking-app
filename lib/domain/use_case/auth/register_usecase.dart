import 'package:injectable/injectable.dart';
import '../../entities/auth/user_entity.dart';
import '../../repositories/auth/auth_repo.dart';
@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity> call(String email, String password, String name, int age,String phoneNumber) {
    return repository.register(email, password, name, age,phoneNumber);
  }
}
