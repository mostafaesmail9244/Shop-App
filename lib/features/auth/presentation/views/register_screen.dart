import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/repository/auth_repo_impl.dart';

import '../../../../core/components/components.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/services/locale/cache_helper.dart';
import '../../../../core/utils/app_router.dart';
import '../../data/services/auth_services.dart';
import '../view_model/shop_auth/shop_auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    ShopAuthCubit shopAuthCubit = ShopAuthCubit(AuthRepo(AuthServices(Dio())));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocProvider(
                create: (context) => shopAuthCubit,
                child: BlocConsumer<ShopAuthCubit, ShopAuthState>(
                  listener: (context, state) {
                    if (state is ShopRegisterSuccessState) {
                      if (state.userModel.status) {
                        flutterToast(
                            text: state.userModel.message,
                            state: ToastEnum.success);
                        Constant.token = state.userModel.data!.token;
                        //save token in sharedPref
                        CacheHelper.saveData(
                                key: Constant.kToken,
                                value: state.userModel.data!.token)
                            .then((value) => Navigator.pushReplacementNamed(
                                context, AppRouter.kHomeScreen));
                        debugPrint(state.userModel.data!.token);
                        //navigat
                      } else {
                        flutterToast(
                            text: state.userModel.message,
                            state: ToastEnum.error);
                      }
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style:
                              TextStyle(fontSize: 19, color: Colors.grey[700]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormFeild(
                          controller: nameController,
                          type: TextInputType.text,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "name is required";
                            }
                          },
                          prefixIcon: Icons.person,
                          // onTap: () {},
                          label: const Text('name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFormFeild(
                          controller: phoneController,
                          type: TextInputType.number,
                          validator: (String value) {
                            if (value.length <= 10) {
                              return "phone is too short";
                            }
                          },
                          // onTap: () {},
                          label: const Text('phone'),
                          prefixIcon: Icons.phone,
                        ),
                        const SizedBox(
                          height: 15,
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
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "password is too short";
                              }
                            },
                            obscureText: shopAuthCubit.isPassword,
                            label: const Text('Password'),
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: shopAuthCubit.iconVisibilty,
                            suffixTap: () {
                              shopAuthCubit.changePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                              onPressed: () {
                                registerMethod(
                                    formKey,
                                    context,
                                    nameController,
                                    passwordController,
                                    emailController,
                                    phoneController);
                              },
                              text: 'register'),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerMethod(
      GlobalKey<FormState> formKey,
      BuildContext context,
      TextEditingController nameController,
      TextEditingController passwordController,
      TextEditingController emailController,
      TextEditingController phoneController) {
    if (formKey.currentState!.validate()) {
      ShopAuthCubit.get(context).createUser(
          name: nameController.text,
          password: passwordController.text,
          email: emailController.text,
          phone: phoneController.text);
    }
  }
}
