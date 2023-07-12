part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSuccessState extends SearchState {
  
}

class SearchLoadinfState extends SearchState {}

class SearchErrorState extends SearchState {
  final String error;

  const SearchErrorState({required this.error});
}
