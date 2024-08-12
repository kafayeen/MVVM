import 'package:book_views/core/utlis/api_constance.dart';
import 'package:dio/dio.dart';

class DioService {
  static late Dio dio;
  final Map<String, dynamic> _headers = {
    "x-rapidapi-host": "goodreads12.p.rapidapi.com",
    "x-rapidapi-key": ApiConstance.apiKey
  };
  init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstance.baseUrl, headers: _headers));
  }

  Future<Response> get(
      {required String path, required Map<String, dynamic> params}) async {
    return await dio.get(
      path,
      queryParameters: params,
    );
  }
}
