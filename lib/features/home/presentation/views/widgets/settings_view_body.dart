import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/components/components.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/services/locale/cache_helper.dart';
import '../../../../../core/utils/app_router.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getUserData();
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccessState) {
          nameController.text = state.userModel.data!.name!;
          emailController.text = state.userModel.data!.email!;
          phoneController.text = state.userModel.data!.phone!;
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ProfileLoadingState,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
          builder: (context) => Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  defaultTextFormFeild(
                      prefixIcon: Icons.person,
                      label: const Text('name'),
                      controller: nameController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'can\'t be empty';
                        }
                      },
                      type: TextInputType.name),
                  const SizedBox(height: 20),
                  defaultTextFormFeild(
                      prefixIcon: Icons.email,
                      label: const Text('Email'),
                      controller: emailController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'can\'t be empty';
                        }
                      },
                      type: TextInputType.name),
                  const SizedBox(height: 20),
                  defaultTextFormFeild(
                      prefixIcon: Icons.phone,
                      label: const Text('Phone'),
                      controller: phoneController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'can\'t be empty';
                        }
                      },
                      type: TextInputType.name),
                  const SizedBox(height: 20),
                  defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.updateUserData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text);
                        }
                      },
                      text: 'Update'),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      onPressed: () {
                        logOut(context);
                      },
                      text: 'Log Out')
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void logOut(BuildContext context) {
    CacheHelper.removeData(key: Constant.kToken).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, AppRouter.kLoginScreen);
      }
    });
  }
}
