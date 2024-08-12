import 'dart:developer';

import 'package:book_views/core/dio_service/dio_service.dart';
import 'package:book_views/core/failure/failure.dart';
import 'package:book_views/core/service_locator/service_locator.dart';
import 'package:book_views/core/utlis/api_constance.dart';
import 'package:book_views/features/show_books_details/data/models/show_books_model/show_books_model.dart';
import 'package:book_views/features/show_books_details/data/repository/show_books_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ShowBooksImpRepo implements ShowBooksBaseRepo {
  @override
  Future<Either<Failure, List<ShowBooksModel>>> getActionBooks() async {
    try {
      var result = await sl<DioService>().get(
          path: ApiConstance.ksearchQuotes,
          params: {"page": 1, "keyword": "action"});
      return Right(List<ShowBooksModel>.from(
          (result.data).map((e) => ShowBooksModel.fromJson(e))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDio(e));
      }
      log("${e.toString()}==");
      return Left(ServiceFailure(error: "we will fix it"));
    }
  }

  @override
  Future<Either<Failure, List<ShowBooksModel>>> getProgrammingBooks() async {
    try {
      var result = await sl<DioService>().get(
          path: ApiConstance.ksearchQuotes,
          params: {"page": 1, "keyword": "programming"});
      return Right(List<ShowBooksModel>.from(
          (result.data).map((e) => ShowBooksModel.fromJson(e))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDio(e));
      }
      log("programming==${e.toString()}");
      return Left(ServiceFailure(error: "we will fix it"));
    }
  }

  @override
  Future<Either<Failure, List<ShowBooksModel>>> getRomanticBooks() async {
    try {
      var result = await sl<DioService>().get(
          path: ApiConstance.ksearchQuotes,
          params: {"page": 1, "keyword": "romantic"});
      return Right(List<ShowBooksModel>.from(
          (result.data).map((e) => ShowBooksModel.fromJson(e))));
    } catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDio(e));
      }
      log("programming==${e.toString()}");
      return Left(ServiceFailure(error: "we will fix it"));
    }
  }
  // @override
  // Future<Either<Failure, List<ShowBooksModel>>> getRomanticBooks() async {
  //   try {
  //     var results = await sl<DioService>().get(
  //         path: ApiConstance.ksearchQuotes,
  //         params: {"page": 1, "keyword": "romantic"});
  //     log(results.data[0]);
  //     return Right(List<ShowBooksModel>.from(
  //         (results.data).map((e) => ShowBooksModel.fromJson(e))));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return Left(ServiceFailure.fromDio(e));
  //     }
  //     log("${e.toString()}romantic");
  //     return Left(ServiceFailure(error: "we will fix later"));
  //   }
  // }
}
