// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/models/auth_model/user_model.dart';
import 'package:store_app/features/auth/data/repository/auth_repo_impl.dart';

part 'shop_auth_state.dart';

class ShopAuthCubit extends Cubit<ShopAuthState> {
  ShopAuthCubit(this.authRepo) : super(ShopLoginInitialState());
  AuthRepo authRepo;
  // UserModel? loginModel;

  static ShopAuthCubit get(context) => BlocProvider.of(context);

  void userLoin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    authRepo.loginUser(email: email, password: password).then((value) {
      debugPrint(value.data!.name);
      emit(ShopLoginSuccessState(loginModel: value));
    }).catchError((error) {
      emit(ShopLoginErrorState(error: error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(ShopRegisterLoadingState());
    authRepo
        .createUser(email: email, password: password, phone: phone, name: name)
        .then((value) {
      emit(ShopRegisterSuccessState(userModel: value));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ShopRegisterErrorState(error: error.toString()));
    });
  }

  IconData iconVisibilty = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    iconVisibilty =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibility());
  }
}
