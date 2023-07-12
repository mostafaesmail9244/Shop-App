import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/search/data/models/search_model.dart';
import 'package:store_app/features/search/data/services/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchRepo searchRepo;
  SearchModel? searchModel;
  void search({required String txt}) {
    emit(SearchLoadinfState());
    searchRepo.search(txt: txt).then((value) {
      searchModel = value;
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(error: error.toString()));
    });
  }
}
