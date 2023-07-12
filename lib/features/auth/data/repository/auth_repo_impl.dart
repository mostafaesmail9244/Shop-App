import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/features/auth/data/models/auth_model/user_model.dart';
import 'package:store_app/features/auth/data/services/auth_services.dart';

class AuthRepo {
  final AuthServices authServices;
  UserModel? userModel;
  AuthRepo(this.authServices);
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    userModel =
        await authServices.loginUser({'email': email, 'password': password});
    return userModel!;
  }

  Future<UserModel> createUser(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    return await authServices.registerUser({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    });
  }

  Future<UserModel> getDataUser() async {
    return await authServices.getUserData(Constant.token!);
  }

  Future<UserModel> updateUserData(
      {required String name,
      required String email,
      required String phone}) async {
    return await authServices.updateUserData(
        {'name': name, 'email': email, 'phone': phone}, Constant.token!);
  }
}
