import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:store_app/features/categories/data/models/categories_model.dart';
import 'package:store_app/features/home/data/models/home_model.dart';

import '../../../favorites/data/models/favorite_model.dart';
import '../../../favorites/data/models/favorites_model.dart';

part 'services.g.dart';

@RestApi(baseUrl: "https://student.valuxapps.com/api/")
abstract class Services {
  factory Services(Dio dio, {String baseUrl}) = _Services;
  @Headers({
    'Content-Type': 'application/json',
    'lang': 'en',
  })
  @GET("home")
  Future<HomeModel> fetchData(
    @Header('Authorization') String token,
  );
  @GET("categories")
  Future<CategoriesModel> fetchCategories(
    @Header('Authorization') String token,
  );
  @POST('favorites')
  Future<FavoriteModel> addFavorites(
      @Body() Map<String, dynamic> data, @Header('Authorization') String token);

  @GET('favorites')
  Future<FavoritesModel> fetchFavorites(
    @Header('Authorization') String token,
  );
}
