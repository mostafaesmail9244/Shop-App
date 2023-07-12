import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/view_model/shop_app_cubit/shop_cubit.dart';

import '../../../../../core/constant/constant.dart';
import '../../../data/models/home_model.dart';

class ProductINF extends StatelessWidget {
  const ProductINF({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            productModel.name,
            style: const TextStyle(fontSize: 14, height: 1.1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Column(children: [
                Text(
                  ("${productModel.price}"),
                  style: const TextStyle(
                      fontSize: 14,
                      color: Constant.defaultColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                if (productModel.oldPrice != productModel.price)
                  Text(
                    ("${productModel.oldPrice}"),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
              ]),
              const Spacer(),
              BlocBuilder<ShopCubit, ShopState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).addFavorites(productModel.id!);
                        },
                        icon: CircleAvatar(
                          backgroundColor: ShopCubit.get(context)
                                  .favorites[productModel.id!]!
                              ? Constant.defaultColor
                              : Colors.grey,
                          radius: 14,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context)
                              .addCart(productId: productModel.id!);
                        },
                        icon: CircleAvatar(
                          backgroundColor:
                              ShopCubit.get(context).carts[productModel.id!]!
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
