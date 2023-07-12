import 'package:dio/dio.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/features/categories/data/models/categories_model.dart';
import 'package:store_app/features/home/data/services/services.dart';

import '../../../favorites/data/models/favorite_model.dart';
import '../../../favorites/data/models/favorites_model.dart';
import '../models/home_model.dart';

class HomeRepo {
  Services services = Services(Dio());
  Future<HomeModel> fetcheData() async {
    return await services.fetchData(Constant.kToken);
  }

  Future<CategoriesModel> fetchCategories() async {
    return await services.fetchCategories(Constant.kToken);
  }

  Future<FavoritesModel> fetchFavorites() async {
    return await services.fetchFavorites(Constant.token!);
  }

  Future<FavoriteModel> addFavorites(int productId) async {

    return await services.addFavorites({"product_id": productId}, Constant.token!);
  }
}
//flutter pub run build_runner build