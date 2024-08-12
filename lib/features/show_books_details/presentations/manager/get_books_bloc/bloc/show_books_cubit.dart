import 'dart:developer';

import 'package:book_views/features/show_books_details/data/models/show_books_model/show_books_model.dart';
import 'package:book_views/features/show_books_details/data/repository/show_books_base_repo.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/states/show_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBooksCubit extends Cubit<ShowBooksStates> {
  final ShowBooksBaseRepo showBooksBaseRepo;
  static ShowBooksCubit get(context) => BlocProvider.of(context);
  ShowBooksCubit(this.showBooksBaseRepo) : super(ShowBooksInitialState());
  List<ShowBooksModel> action = [];
  List<ShowBooksModel> romantic = [];
  List<ShowBooksModel> programming = [];

  void getAction() async {
    emit(ShowBooksActionLoadingState());
    var r = await showBooksBaseRepo.getActionBooks();
    r.fold((l) => emit(ShowBooksActionErrorState(error: l.error)), (success) {
      action = success;
      emit(ShowBooksActionSuccessState());
    });
  }

  void getRomantic() async {
    var r = await showBooksBaseRepo.getRomanticBooks();
    r.fold((l) => emit(ShowBooksRomanticErrorState(error: l.error)), (success) {
      romantic = success;
      emit(ShowBooksRomanticSuccessState());
    });
  }

  void getProgramming() async {
    emit(ShowBooksProgrammingLoadingState());
    var r = await showBooksBaseRepo.getProgrammingBooks();
    r.fold((l) {
      log(l.error);
      emit(ShowBooksProgrammingErrorState(error: l.error));
    }, (success) {
      log(success[0].imageUrl!);
      programming = success;
      emit(ShowBooksProgrammingSuccessState());
    });
  }
}
