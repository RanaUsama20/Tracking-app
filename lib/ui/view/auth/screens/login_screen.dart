import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../domain/use_case/auth/login_usecase.dart';
import '../../../../domain/use_case/auth/register_usecase.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../view_model/cubit/auth/auth_cubit.dart';
import '../../../view_model/cubit/auth/auth_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthCubit cubit = AuthCubit(
    GetIt.instance<LoginUseCase>(),
    GetIt.instance<RegisterUseCase>(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => cubit..login,
        child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamed(context, Routes.home);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 100.h),
                      Text(
                        LocaleKeys.signIn.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 60.h),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: _emailController,
                                label: LocaleKeys.email.tr(),
                                labelTextStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                hint: LocaleKeys.enterYourEmail.tr(),
                                hintTextStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                validation: (val) =>
                                    Validator.validateEmail(val),
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              CustomTextFormField(
                                controller: _passwordController,
                                label: LocaleKeys.password.tr(),
                                labelTextStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                hint: LocaleKeys.enterYourPassword.tr(),
                                hintTextStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                isObscured: true,
                                validation: (val) =>
                                    Validator.validatePassword(val),
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomButton(
                            label: LocaleKeys.signIn.tr(),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.login(_emailController.text,
                                    _passwordController.text);
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.noAccount.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.register);
                              },
                              child: Text(
                                LocaleKeys.signUp.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: ColorManager.steelBlue),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
