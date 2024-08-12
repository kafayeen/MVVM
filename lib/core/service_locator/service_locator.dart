import 'package:book_views/core/dio_service/dio_service.dart';
import 'package:book_views/features/search/data/repo/search_base_repo.dart';
import 'package:book_views/features/search/data/repo/search_imp_repo.dart';
import 'package:book_views/features/show_books_details/data/repository/show_books_base_repo.dart';
import 'package:book_views/features/show_books_details/data/repository/show_books_imp_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

abstract class ServiceLocator {
  static void init() {
    sl.registerLazySingleton<SearchBaseRepo>(() => SearchImpRepo());
    sl.registerLazySingleton<DioService>(() => DioService());
    sl.registerLazySingleton<ShowBooksBaseRepo>(() => ShowBooksImpRepo());
  }
}
