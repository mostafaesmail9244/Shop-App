import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/data/models/auth_model/user_model.dart';
import 'package:store_app/features/auth/data/repository/auth_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepo) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  AuthRepo authRepo;
  UserModel? userModel;

  void getUserData() {
    emit(ProfileLoadingState());
    authRepo.getDataUser().then((value) {
      emit(ProfileSuccessState(userModel: value));
    }).catchError((error) {
      emit(ProfileErrorState(error: error.toString()));
    });
  }

  void updateUserData(
      {required String name, required String email, required String phone}) {
    emit(UpdateProfileLoadingState());
    authRepo
        .updateUserData(name: name, email: email, phone: phone)
        .then((value) {
      userModel = value;
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      emit(UpdateProfileErrorState(error: error.toString()));
    });
  }
}
