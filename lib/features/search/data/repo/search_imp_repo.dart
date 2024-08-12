import 'package:book_views/core/dio_service/dio_service.dart';
import 'package:book_views/core/failure/failure.dart';
import 'package:book_views/core/service_locator/service_locator.dart';
import 'package:book_views/core/utlis/api_constance.dart';
import 'package:book_views/features/search/data/models/search_models/search_models.dart';
import 'package:book_views/features/search/data/repo/search_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchImpRepo implements SearchBaseRepo {
  @override
  Future<Either<Failure, List<SearchModels>>> getTheBookSearch(
      {required String nameTheBook}) async {
    try {
      var response = await sl<DioService>().get(
          path: ApiConstance.ksearch,
          params: {"page": 1, "keyword": nameTheBook});
      return Right(List<SearchModels>.from(
          (response.data).map((e) => SearchModels.fromFromJson(e))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDio(e));
      } else {
        return Left(ServiceFailure(error: "Please wai until fix this"));
      }
    }
  }
}
