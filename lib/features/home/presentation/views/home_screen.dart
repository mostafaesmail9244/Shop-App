import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/products_view.dart';
import 'package:store_app/features/home/presentation/views/settings_view.dart';

import '../../../../core/utils/app_router.dart';
import 'categories_view.dart';
import '../../../favorites/presentation/views/favorites_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  int currnetIndex = 0;
  List<Widget> bottomScreens = const [
    ProductsView(),
    CategoriesView(),
    FavoritesView(),
    SettingsView(),
  ];
  List<Icon> icons = const [
    Icon(Icons.home, size: 27),
    Icon(Icons.apps, size: 27),
    Icon(Icons.favorite, size: 27),
    Icon(Icons.settings, size: 27),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Salla',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.kSearchScreen);
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.kCartScreen);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: bottomScreens[currnetIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blueGrey[100],
        items: icons,
        onTap: (index) {
          setState(() {
            currnetIndex = index;
          });
        },
        index: currnetIndex,
      ),
    );
  }
}
