import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_information.dart';

import '../../../data/models/home_model.dart';

Widget buildGridProduct(ProductModel productModel) => Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(productModel.image),
                width: double.infinity,
                height: 200,
              ),
              if (productModel.discount != 0)
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
                    )),
            ],
          ),
          ProductINF(productModel: productModel),
        ],
      ),
    );

Widget widgetBuilder({required HomeModel homeModel}) => CarouselSlider(
      items: homeModel.data?.banners!
          .map((e) => Image(
                image: NetworkImage(e.image),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
          height: 250,
          viewportFraction: 1,
          initialPage: 0,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          scrollDirection: Axis.horizontal),
    );
