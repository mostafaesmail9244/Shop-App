// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String error;

  const ProfileErrorState({required this.error});
}

class ProfileSuccessState extends ProfileState {
  final UserModel userModel;
  const ProfileSuccessState({
    required this.userModel,
  });
}

class ProfileLoadingState extends ProfileState {}

class UpdateProfileErrorState extends ProfileState {
  final String error;

  const UpdateProfileErrorState({required this.error});
}

class UpdateProfileSuccessState extends ProfileState {}

class UpdateProfileLoadingState extends ProfileState {}
