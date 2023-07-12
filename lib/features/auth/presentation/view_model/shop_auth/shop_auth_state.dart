part of 'shop_auth_cubit.dart';

abstract class ShopAuthState {}

class ShopLoginInitialState extends ShopAuthState {}

class ShopLoginSuccessState extends ShopAuthState {
  final UserModel loginModel;

  ShopLoginSuccessState({required this.loginModel});
}

class ShopLoginLoadingState extends ShopAuthState {}

class ShopLoginErrorState extends ShopAuthState {
  final String error;

  ShopLoginErrorState({required this.error});
}

class ShopRegisterSuccessState extends ShopAuthState {
  final UserModel userModel;

  ShopRegisterSuccessState({required this.userModel});
}

class ShopRegisterLoadingState extends ShopAuthState {}

class ShopRegisterErrorState extends ShopAuthState {
  final String error;

  ShopRegisterErrorState({required this.error});
}

class ShopChangePasswordVisibility extends ShopAuthState {}
