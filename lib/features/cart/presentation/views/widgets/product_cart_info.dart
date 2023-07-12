import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/cart/data/models/cart_model.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../home/presentation/view_model/shop_app_cubit/shop_cubit.dart';

class ProductCartInfo extends StatelessWidget {
  const ProductCartInfo({
    super.key,
    required this.productInfo,
  });
  final Product productInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            productInfo.name,
            style: const TextStyle(fontSize: 14, height: 1.1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                ("${productInfo.price}"),
                style:
                    const TextStyle(fontSize: 12, color: Constant.defaultColor),
              ),
              const SizedBox(
                width: 5,
              ),
              if (productInfo.oldPrice != productInfo.price)
                Text(
                  ("${productInfo.oldPrice}"),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              const Spacer(),
              BlocBuilder<ShopCubit, ShopState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).addFavorites(productInfo.id!);
                        },
                        icon: CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).favorites[productInfo.id]!
                                  ? Constant.defaultColor
                                  : Colors.grey,
                          radius: 15,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context)
                              .addCart(productId: productInfo.id!);
                        },
                        icon: CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).carts[productInfo.id]!
                                  ? Constant.defaultColor
                                  : Colors.grey,
                          radius: 15,
                          child: const Icon(
                            Icons.add_shopping_cart,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
