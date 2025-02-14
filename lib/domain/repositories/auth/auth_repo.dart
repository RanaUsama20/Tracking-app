import '../../entities/auth/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> register(String email, String password, String name, int age, String phoneNumber);
  Future<UserEntity> login(String email, String password);
}
