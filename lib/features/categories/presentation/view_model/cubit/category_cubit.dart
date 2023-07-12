// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_app/features/categories/data/models/categories_model.dart';
// import 'package:store_app/features/categories/data/services/categories_services.dart';

// part 'category_state.dart';

// class CategoryCubit extends Cubit<CategoryState> {
//   CategoryCubit(this.categoriesServices) : super(CategoryInitial());
//   static CategoryCubit get(context) => BlocProvider.of<CategoryCubit>(context);
//   CategoriesServices categoriesServices;
//   late CategoriesModel categoriesModel;
//   void fetchCategories() {
//     emit(CategoryLoadingState());
//     categoriesServices.fetchData().then((value) {
//       categoriesModel = value;
//       debugPrint(categoriesModel.status.toString());
//       emit(CategorySuccsessState());
//     }).catchError((error) {
//       debugPrint(error.toString());
//       emit(CategoryErrorState(error: error.toString()));
//     });
//   }
// }
