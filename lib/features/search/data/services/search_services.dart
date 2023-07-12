import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../models/search_model.dart';

part 'search_services.g.dart';

@RestApi(baseUrl: "https://student.valuxapps.com/api/")
abstract class SearchServices {
  factory SearchServices(Dio dio, {String baseUrl}) = _SearchServices;
  @Headers({
    'Content-Type': 'application/json',
    'lang': 'en',
  })
  @POST('products/search')
  Future<SearchModel> search(
      @Body() Map<String, dynamic> data, @Header('Authorization') String token);
}
