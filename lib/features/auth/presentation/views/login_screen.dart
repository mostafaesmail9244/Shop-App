import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/components/components.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/core/services/locale/cache_helper.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:store_app/features/auth/data/services/auth_services.dart';

import '../view_model/shop_auth/shop_auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    ShopAuthCubit shopAuthCubit = ShopAuthCubit(AuthRepo(AuthServices(Dio())));
    return BlocProvider(
      create: (context) => shopAuthCubit,
      child: BlocConsumer<ShopAuthCubit, ShopAuthState>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status) {
              flutterToast(
                  text: state.loginModel.message, state: ToastEnum.success);

              Constant.token = state.loginModel.data!.token;

              //save token in sharedPref
              CacheHelper.saveData(
                      key: Constant.kToken, value: state.loginModel.data!.token)
                  .then((value) => Navigator.pushReplacementNamed(
                      context, AppRouter.kHomeScreen));
              debugPrint(state.loginModel.data!.token);
            } else {
              flutterToast(
                  text: state.loginModel.message, state: ToastEnum.error);
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style:
                              TextStyle(fontSize: 19, color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormFeild(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "email is required";
                              }
                            },
                            // onTap: () {},
                            label: const Text('Email Addresse'),
                            prefixIcon: Icons.email_outlined),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFormFeild(
                            controller: passwordController,
                            type: TextInputType.text,
                            obscureText: shopAuthCubit.isPassword,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "password is too short";
                              }
                            },
                            onSubmit: (value) {
                              loginMethod(formKey, shopAuthCubit,
                                  emailController, passwordController, context);
                            },
                            label: const Text('Password'),
                            prefixIcon: Icons.lock_outline,
                            suffixTap: () {
                              shopAuthCubit.changePasswordVisibility();
                            },
                            suffixIcon: shopAuthCubit.iconVisibilty),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                              onPressed: () {
                                loginMethod(
                                    formKey,
                                    shopAuthCubit,
                                    emailController,
                                    passwordController,
                                    context);
                              },
                              text: 'login'),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            defaultTextButton(
                              text: 'register',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRouter.kRegisterScreen);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void snackBar(BuildContext context, ShopLoginSuccessState state,
      {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void loginMethod(
      GlobalKey<FormState> formKey,
      ShopAuthCubit shopshopauthCubit,
      TextEditingController emailController,
      TextEditingController passwordController,
      BuildContext context) {
    if (formKey.currentState!.validate()) {
      shopshopauthCubit.userLoin(
          email: emailController.text, password: passwordController.text);
    }
  }
}
