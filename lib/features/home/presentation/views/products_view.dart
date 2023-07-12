import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/categories/data/models/categories_model.dart';
import 'package:store_app/features/home/data/models/home_model.dart';
import 'package:store_app/features/home/presentation/view_model/shop_app_cubit/shop_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/build_grid_product.dart';
import 'package:store_app/features/home/presentation/views/widgets/carousel_slider_builder.dart';

import '../../../../core/components/components.dart';
import '../../../categories/presentation/views/widgets/categories_builder.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ShopCubit>(context);
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ChangeFavoritesSuccsessState) {
          if (!state.favoriteModel.status) {
            flutterToast(
                text: state.favoriteModel.message, state: ToastEnum.error);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          builder: (context) => widgetBuilder(
              homeModel: cubit.homeModel!,
              categoriesModel: cubit.categoriesModel!,
              context: context),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget widgetBuilder(
          {required HomeModel homeModel,
          required CategoriesModel categoriesModel,
          context}) =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            carouselSliderBuilder(homeModel: homeModel),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CategoriesBuilder(
                        dataModelC: categoriesModel.data!.data![index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                  itemCount: categoriesModel.data!.data!.length),
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.05 / 1.8,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    homeModel.data!.products!.length,
                    (index) =>
                        buildGridProduct(homeModel.data!.products![index])),
              ),
            )
          ],
        ),
      );
}
