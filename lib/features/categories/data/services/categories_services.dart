import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/core/services/remote/dio_helper.dart';
import 'package:store_app/features/categories/data/models/categories_model.dart';

class CategoriesServices {
  Future<CategoriesModel> fetchData() async {
    late CategoriesModel categoriesModel;
    try {
      Response response =
          await DioHelper.getData(path: 'categories', token: Constant.token);
      categoriesModel = CategoriesModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint('****Dio error****');
        debugPrint('Status Code: ${e.response?.statusCode}');
        debugPrint('Data: ${e.response?.data}');
      } else {
        // Error due to setting up or sending the request
        debugPrint('****Error****');
        debugPrint(e.message);
      }
    }
    return categoriesModel;
  }
}
