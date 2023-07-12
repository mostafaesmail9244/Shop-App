// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shop_cubit.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopErrorState extends ShopState {
  final String error;

  const ShopErrorState(this.error);
}

class ShopChangeBottomNavState extends ShopState {}

class CategoryLoadingState extends ShopState {}

class CategorySuccsessState extends ShopState {}

class CategoryErrorState extends ShopState {
  final String error;

  const CategoryErrorState({required this.error});
}

class FavoritesLoadingState extends ShopState {}

class FavoritesSuccsessState extends ShopState {}

class FavoritesErrorState extends ShopState {
  final String error;

  const FavoritesErrorState({required this.error});
}

class ChangeFavoritesSuccsessState extends ShopState {
  final FavoriteModel favoriteModel;
  const ChangeFavoritesSuccsessState({
    required this.favoriteModel,
  });
}

class ChangeFavoritesState extends ShopState {}

class ChangeFavoritesErrorState extends ShopState {
  final String error;

  const ChangeFavoritesErrorState({required this.error});
}

class CartFetchSuccessState extends ShopState {}

class CartFetchErrorState extends ShopState {
  final String error;
  const CartFetchErrorState({
    required this.error,
  });
}

class CartFetchLoadingState extends ShopState {}

class CartAddLoadingState extends ShopState {}

class CartAddSuccessState extends ShopState {}

class CartAddErrorState extends ShopState {
  final String error;
  const CartAddErrorState({
    required this.error,
  });
}
