import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/core/constant/constant.dart';
import 'package:store_app/core/services/locale/cache_helper.dart';
import 'package:store_app/core/services/remote/dio_helper.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/features/auth/presentation/views/login_screen.dart';
import 'package:store_app/features/cart/data/service/cart_repo.dart';
import 'package:store_app/features/cart/data/service/cart_services.dart';
import 'package:store_app/features/home/data/services/home_repo.dart';

import 'bloc_observer.dart';
import 'features/auth/presentation/views/on_bording_screen.dart';
import 'features/home/presentation/view_model/shop_app_cubit/shop_cubit.dart';
import 'features/home/presentation/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBording = CacheHelper.getData(key: Constant.kOnBoarding) ?? false;
  Constant.token = CacheHelper.getData(key: Constant.kToken);
  debugPrint("$onBording");
  debugPrint("${Constant.token} ");

  Widget widget = homeWidget(onBording, Constant.token);
  runApp(MyApp(
    widget: widget,
  ));
}

Widget homeWidget(
  bool? onBording,
  String? token,
) {
  Widget widget;
  if (onBording == true) {
    if (token == null) {
      widget = const LoginScreen();
    } else {
      widget = const HomeScreen();
    }
  } else {
    widget = const OnBordingScreen();
  }
  return widget;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    ShopCubit shopCubit =
        ShopCubit((HomeRepo()), CartRepo(CartServices(Dio())));
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => shopCubit
                ..fetcheData()
                ..fetchCategories()
                ..fetchFavorites()..fetchCarts()),
    
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: AppRouter.router,
          theme: ThemeData(
              primarySwatch: Constant.defaultColor,
              primaryColor: Constant.defaultColor),
          home: widget,
        ),
      ),
    );
  }
}
