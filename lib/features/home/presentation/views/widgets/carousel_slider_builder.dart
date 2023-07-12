//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/home_model.dart';

Widget carouselSliderBuilder({required HomeModel homeModel}) => CarouselSlider(
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
