import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/models/home_model.dart';
import 'package:store_app/features/home/data/services/home_repo.dart';

import '../../../../cart/data/models/cart_model.dart';
import '../../../../cart/data/service/cart_repo.dart';
import '../../../../categories/data/models/categories_model.dart';
import '../../../../favorites/data/models/favorite_model.dart';
import '../../../../favorites/data/models/favorites_model.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.homeRepo, this.cartRepo) : super(ShopInitial());

  HomeRepo homeRepo;

  HomeModel? homeModel;

  static ShopCubit get(context) => BlocProvider.of(context);
  Map<int, bool> favorites = {};
  Map<int, bool> carts = {};
  void fetcheData() {
    emit(ShopLoadingState());
    homeRepo.fetcheData().then((value) {
      homeModel = value;
      debugPrint("${homeModel?.status}");
      //add elementFavorite to map
      value.data?.products?.forEach((element) {
        favorites.addAll({element.id!: element.inFavorite!});
      });
      // add elementCart to map
      value.data?.products?.forEach((element) {
        carts.addAll({element.id!: element.inCart!});
      });

      debugPrint('map fav isss $favorites');
      emit(ShopSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ShopErrorState(error.toString()));
    });
  }

  late FavoriteModel favoriteModel;
  late FavoritesModel favoritesModel;

  void fetchFavorites() {
    emit(FavoritesLoadingState());
    homeRepo.fetchFavorites().then((value) {
      favoritesModel = value;

      emit(FavoritesSuccsessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FavoritesErrorState(error: error.toString()));
    });
  }

  void addFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesState());
    homeRepo.addFavorites(productId).then((value) {
      favoriteModel = value;
      debugPrint(value.message);
      if (!favoriteModel.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        fetchFavorites();
      }
      emit(ChangeFavoritesSuccsessState(favoriteModel: value));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(ChangeFavoritesErrorState(error: error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void fetchCategories() {
    emit(CategoryLoadingState());
    homeRepo.fetchCategories().then((value) {
      categoriesModel = value;
      debugPrint(categoriesModel!.status.toString());
      emit(CategorySuccsessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CategoryErrorState(error: error.toString()));
    });
  }

  CartRepo cartRepo;
  CartModel? cartModel;
  void fetchCarts() {
    emit(CartFetchLoadingState());
    cartRepo.fetchCarts().then((value) {
      cartModel = value;
      emit(CartFetchSuccessState());
    }).catchError((error) {
      emit(CartFetchErrorState(error: error.toString()));
    });
  }

  void addCart({required int productId}) {
    carts[productId] = !carts[productId]!;
    emit(CartAddLoadingState());
    cartRepo.addCart(productId).then((value) {
      cartModel = value;
      if (!cartModel!.status!) {
        carts[productId] = !carts[productId]!;
      } else {
        fetchCarts();
      }
      emit(CartAddSuccessState());
    }).catchError((error) {
      carts[productId] = !carts[productId]!;
      emit(CartAddErrorState(error: error.toString()));
    });
  }

  // int currnetIndex = 0;
  // GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  // List<Widget> bottomScreens = const [
  //   ProductsView(),
  //   CategoriesView(),
  //   FavoritesView(),
  //   SettingsView(),
  // ];
  // List<Icon> icons = const [
  //   Icon(Icons.home, size: 30),
  //   Icon(Icons.apps, size: 27),
  //   Icon(Icons.favorite, size: 27),
  //   Icon(Icons.settings, size: 27),z
  // ];
  // void changeIndex(index) {
  //   currnetIndex = index;
  //   emit(ShopChangeBottomNavState());
  // }
}
