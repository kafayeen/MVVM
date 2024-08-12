import 'package:equatable/equatable.dart';

abstract class SearchEvents extends Equatable {}

class SearchNameOfBookEvent extends SearchEvents {
  final String nameOfBook;
  SearchNameOfBookEvent({required this.nameOfBook});

  @override
  List<Object?> get props => [nameOfBook];
}
