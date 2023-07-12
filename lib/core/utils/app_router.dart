import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/presentation/views/login_screen.dart';
import 'package:store_app/features/auth/presentation/views/on_bording_screen.dart';
import 'package:store_app/features/auth/presentation/views/register_screen.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';

import '../../features/home/presentation/views/home_screen.dart';
import '../../features/search/presentation/views/search_view.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get router => {
        kONBoarding: (context) => const OnBordingScreen(),
        kHomeScreen: (context) => const HomeScreen(),
        kRegisterScreen: (context) => const RegisterScreen(),
        kLoginScreen: (context) => const LoginScreen(),
        kSearchScreen: (context) => const SearchView(),
        kCartScreen: (context) => const CartView(),
      };
  static const kONBoarding = 'onBoarding';
  static const kLoginScreen = 'loginScreen';
  static const kRegisterScreen = 'registerScreen';
  static const kHomeScreen = 'homeScreen';
  static const kSearchScreen = 'searchScreen';
  static const kCartScreen = 'cartScreen';
  static final appRouter = GoRouter(routes: [
    GoRoute(
      path: kONBoarding,
      builder: (context, state) => const OnBordingScreen(),
    ),
    GoRoute(
      path: kLoginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: kRegisterScreen,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: kHomeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: kCartScreen,
      builder: (context, state) => const CartView(),
    ),
  ]);
}
