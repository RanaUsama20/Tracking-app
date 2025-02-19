
import '../../../../domain/entities/auth/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
 final UserEntity user;
 AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
 final String error;
 AuthFailure(this.error);
}
