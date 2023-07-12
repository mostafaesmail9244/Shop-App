import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';

part 'cart_services.g.dart';

@RestApi(baseUrl: "https://student.valuxapps.com/api/")
abstract class CartServices {
  factory CartServices(Dio dio, {String baseUrl}) = _CartServices;
  @Headers({
    'Content-Type': 'application/json',
    'lang': 'en',
  })
  @GET("carts")
  Future<CartModel> fetchCart(
    @Header('Authorization') String token,
  );

  @POST('carts')
  Future<CartModel> postCarts(
      @Body() Map<String, dynamic> data, @Header('Authorization') String token);
}
