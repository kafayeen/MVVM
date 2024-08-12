import 'package:book_views/features/search/data/models/search_models/search_models.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<SearchModels> searchModel;
  SearchSuccessState({required this.searchModel});
}

class SearchErrorState extends SearchStates {
  final String error;
  SearchErrorState({required this.error});
}
