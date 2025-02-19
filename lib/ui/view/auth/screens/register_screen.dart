import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tracking_app/core/resources/color_manager.dart';
import 'package:tracking_app/core/widgets/custom_button.dart';
import 'package:tracking_app/core/widgets/custom_text_form_field.dart';
import 'package:tracking_app/domain/use_case/auth/login_usecase.dart';
import 'package:tracking_app/domain/use_case/auth/register_usecase.dart';
import 'package:tracking_app/ui/view_model/cubit/auth/auth_states.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/validator.dart';
import '../../../view_model/cubit/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  AuthCubit cubit = AuthCubit(
    GetIt.instance<LoginUseCase>(),
    GetIt.instance<RegisterUseCase>(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => cubit..register,
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
                      'Sign Up',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60.h),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: _nameController,
                              label: 'Name'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Enter your Name'.tr(),
                              hintTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              validation: (val) => Validator.validateName(val),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomTextFormField(
                              controller: _emailController,
                              label: 'Email'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Enter your email'.tr(),
                              hintTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              validation: (val) => Validator.validateEmail(val),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomTextFormField(
                              controller: _passwordController,
                              label: 'Password'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Enter your password'.tr(),
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
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              label: 'Confirm password'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Confirm password'.tr(),
                              hintTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              isObscured: true,
                              validation: (val) =>
                                  Validator.validateConfirmPassword(
                                      val, _passwordController.text),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomTextFormField(
                              controller: _ageController,
                              label: 'Age'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Enter your Age'.tr(),
                              hintTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              validation: (val) => Validator.validateAge(val),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomTextFormField(
                              controller: _phoneNumberController,
                              label: 'Phone number'.tr(),
                              labelTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              hint: 'Enter your Phone number'.tr(),
                              hintTextStyle:
                                  Theme.of(context).textTheme.titleSmall,
                              validation: (val) =>
                                  Validator.validatePhoneNumber(val),
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
                          label: 'sign up'.tr(),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.register(
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text,
                                int.tryParse(_ageController.text) ?? 0,
                                _phoneNumberController.text,
                              );
                            }
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?  ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: Text(
                              'sign in'.tr(),
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
          )),
    );
  }
}
