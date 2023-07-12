import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:store_app/features/auth/data/models/auth_model/user_model.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: "https://student.valuxapps.com/api/")
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;
  @Headers({
    'Content-Type': 'application/json',
    'lang': 'en',
  })
  @POST('login')
  Future<UserModel> loginUser(@Body() Map<String, dynamic> data);
  @POST('register')
  Future<UserModel> registerUser(@Body() Map<String, dynamic> data);

  @GET('profile')
  Future<UserModel> getUserData(@Header('Authorization') String token);

  @PUT('update-profile')
  Future<UserModel> updateUserData(
      @Body() Map<String, dynamic> data, @Header('Authorization') String token);
}
