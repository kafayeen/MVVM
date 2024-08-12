import 'package:book_views/features/search/data/repo/search_base_repo.dart';
import 'package:book_views/features/search/presentations/manager/search_events.dart';
import 'package:book_views/features/search/presentations/manager/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  final SearchBaseRepo searchBaseRepo;
  static SearchBloc get(context) => BlocProvider.of(context);
  SearchBloc(this.searchBaseRepo) : super(SearchInitialState()) {
    on<SearchEvents>((event, emit) async {
      emit(SearchLoadingState());
      if (event is SearchNameOfBookEvent) {
        var result = await searchBaseRepo.getTheBookSearch(
            nameTheBook: event.nameOfBook);
        result.fold((l) => emit(SearchErrorState(error: l.error)),
            (r) => emit(SearchSuccessState(searchModel: r)));
      }
    });
  }
}
