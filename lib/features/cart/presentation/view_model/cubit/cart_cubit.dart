// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/features/cart/data/models/cart_model.dart';
// import 'package:store_app/features/cart/data/service/cart_repo.dart';

// part 'cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   CartCubit(this.cartRepo) : super(CartInitial());

//   static CartCubit get(context) => BlocProvider.of(context);
//   CartRepo cartRepo;
//   CartModel? cartModel;
//   void fetchCarts() {
//     emit(CartFetchLoadingState());
//     cartRepo.fetchCarts().then((value) {
//       cartModel = value;
//       emit(CartFetchSuccessState());
//     }).catchError((error) {
//       emit(CartFetchErrorState(error: error.toString()));
//     });
//   }

//   void addCart({required int productId}) {
//     emit(CartAddLoadingState());
//     cartRepo.addCart(productId).then((value) {
//       cartModel = value;
//       emit(CartAddSuccessState());
//     }).catchError((error) {
//       emit(CartAddErrorState(error: error.toString()));
//     });
//   }
// }
