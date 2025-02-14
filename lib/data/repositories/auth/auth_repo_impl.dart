import 'package:injectable/injectable.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../../domain/repositories/auth/auth_repo.dart';
import '../../data_sources/auth/remote/auth_remote_data_source.dart';


@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> register(String email, String password, String name, int age ,String phoneNumber) {
    return remoteDataSource.register(email, password, name, age, phoneNumber);
  }

  @override
  Future<UserEntity> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
