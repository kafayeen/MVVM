import 'package:book_views/core/failure/failure.dart';
import 'package:book_views/features/search/data/models/search_models/search_models.dart';
import 'package:dartz/dartz.dart';

abstract class SearchBaseRepo {
  Future<Either<Failure, List<SearchModels>>> getTheBookSearch(
      {required String nameTheBook});
}
