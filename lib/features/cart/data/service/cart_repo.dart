// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';
import 'package:store_app/features/cart/data/service/cart_services.dart';

class CartRepo {
  final CartServices cartServices;
  CartRepo(this.cartServices);
  Future<CartModel> fetchCarts() async {
    return await cartServices.fetchCart(Constant.token!);
  }

  Future<CartModel> addCart(int productId) async {
    return await cartServices
        .postCarts({'product_id': productId}, Constant.token!);
  }
}
