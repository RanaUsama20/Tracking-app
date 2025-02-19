import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/use_case/auth/login_usecase.dart';
import '../../../../domain/use_case/auth/register_usecase.dart';
import 'auth_states.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit(this.loginUseCase, this.registerUseCase) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);



  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void register(String email, String password, String name, int age, String phoneNumber) async {
    emit(AuthLoading());
    try {
      final user = await registerUseCase(email, password, name, age, phoneNumber);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
