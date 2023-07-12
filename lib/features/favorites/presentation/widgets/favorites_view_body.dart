import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/favorites/data/models/favorites_model.dart';
import 'package:store_app/features/favorites/presentation/widgets/product_fav_info.dart';
import 'package:store_app/features/home/presentation/view_model/shop_app_cubit/shop_cubit.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: State is! FavoritesLoadingState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => itemBuilder(
                  product: cubit.favoritesModel.data!.data![index].product),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.favoritesModel.data!.data!.length),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget itemBuilder({required ProductInfo product}) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(product.image),
                    width: 120,
                    height: 120,
                  ),
                  if (product.discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Colors.red,
                      ),
                      child: const Text(
                        'Discount',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                ],
              ),
              Expanded(
                  child: ProductFavInfo(
                productInfo: product,
              )),
            ],
          ),
        ),
      );
}
