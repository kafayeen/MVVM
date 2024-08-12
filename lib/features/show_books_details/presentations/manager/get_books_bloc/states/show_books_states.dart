abstract class ShowBooksStates {}

class ShowBooksInitialState extends ShowBooksStates {}

class ShowBooksActionLoadingState extends ShowBooksStates {}

class ShowBooksActionSuccessState extends ShowBooksStates {}

class ShowBooksActionErrorState extends ShowBooksStates {
  final String error;
  ShowBooksActionErrorState({required this.error});
}

class ShowBooksRomanticLoadingState extends ShowBooksStates {}

class ShowBooksRomanticSuccessState extends ShowBooksStates {}

class ShowBooksRomanticErrorState extends ShowBooksStates {
  final String error;
  ShowBooksRomanticErrorState({required this.error});
}

class ShowBooksProgrammingLoadingState extends ShowBooksStates {}

class ShowBooksProgrammingSuccessState extends ShowBooksStates {}

class ShowBooksProgrammingErrorState extends ShowBooksStates {
  final String error;
  ShowBooksProgrammingErrorState({required this.error});
}
