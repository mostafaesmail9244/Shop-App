

// class FavoriteServices {
  // late FavoriteModel favoriteModel;
  // Future fetchFavorites() async {
  //   try {
  //     Response response =
  //         await DioHelper.getData(path: 'favorites', token: Constant.token);
  //     return FavoriteModel.fromJson(response.data);
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       debugPrint('****Dio error****');
  //       debugPrint('Status Code: ${e.response?.statusCode}');
  //       debugPrint('Data: ${e.response?.data}');
  //     } else {
  //       debugPrint(e.toString());
  //     }
  //   }
  // }

  // Future<FavoriteModel> addFavorites(int productId) async {
  //   try {
  //     final response = await DioHelper.postData(
  //         path: 'favorites',
  //         data: {'product_id': productId},
  //         token: Constant.token);

  //     return favoriteModel = FavoriteModel.fromJson(response.data);
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       debugPrint('****Dio error****');
  //       debugPrint('Status Code: ${e.response?.statusCode}');
  //       debugPrint('Data: ${e.response?.data}');
  //     } else {
  //       debugPrint(e.toString());
  //     }
  //   }
  //   return favoriteModel;
  // }
// }

// TOD
// class Error {
//   static String handleError(String error) {
//     String errorDescription = "";
//     if (error is DioException) {
//       DioException dioException = error as DioException;
//       switch (dioException) {
//         case DioExceptionType.cancel:
//           errorDescription = "Request to API server was cancelled";
//           break;
//         case DioExceptionType.connectionTimeout:
//           errorDescription = "Connection timeout with API server";
//           break;
//         case DioExceptionType.unknown:
//           errorDescription =
//               "Connection to API server failed due to internet connection";
//           break;
//         case DioExceptionType.receiveTimeout:
//           errorDescription = "Receive timeout in connection with API server";
//           break;

//         case DioExceptionType.sendTimeout:
//           errorDescription = "Send timeout in connection with API server";
//           break;
//       }
//     } else {
//       errorDescription = "Unexpected error occured";
//     }
//     return errorDescription;
//   }
// }
