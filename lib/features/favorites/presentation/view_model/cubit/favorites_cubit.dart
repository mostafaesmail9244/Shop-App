// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/features/home/data/models/home_model.dart';
// import 'package:store_app/features/home/data/services/home_repo.dart';

// import '../../../data/models/favorite_model.dart';

// part 'favorites_state.dart';

// class FavoritesCubit extends Cubit<FavoritesState> {
//   FavoritesCubit(this.homeRepo) : super(FavoritesInitial());
//   static FavoritesCubit get(context) => BlocProvider.of(context);
//   HomeRepo homeRepo;
//   ProductModel? productModel;
//   late FavoriteModel favoriteModel;

//   // void addFavorites(int idProduct) {
//   //   homeRepo.addFavorites(idProduct).then((value) {
//   //     emit(ChangeFavoritesSuccsessState());
//   //     debugPrint(value.message);
//   //     // favoriteModel = value;
//   //   }).catchError((error) {
//   //     emit(ChangeFavoritesErrorState(error: error));
//   //   });
//   // }
// }
