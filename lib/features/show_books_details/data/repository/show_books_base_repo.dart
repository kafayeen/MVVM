import 'package:book_views/core/failure/failure.dart';
import 'package:book_views/features/show_books_details/data/models/show_books_model/show_books_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShowBooksBaseRepo {
  Future<Either<Failure, List<ShowBooksModel>>> getProgrammingBooks();
  Future<Either<Failure, List<ShowBooksModel>>> getActionBooks();
  Future<Either<Failure, List<ShowBooksModel>>> getRomanticBooks();
}
