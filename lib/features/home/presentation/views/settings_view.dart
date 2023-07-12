import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:store_app/features/auth/data/services/auth_services.dart';
import 'package:store_app/features/home/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit profileCubit = ProfileCubit(AuthRepo(AuthServices(Dio())));
    return BlocProvider(
      create: (context) => profileCubit,
      child: const SettingsViewBody(),
    );
  }
}
