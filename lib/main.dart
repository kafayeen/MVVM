import 'package:book_views/core/dio_service/dio_service.dart';
import 'package:book_views/core/service_locator/service_locator.dart';
import 'package:book_views/core/utlis/go_router.dart';
import 'package:book_views/features/show_books_details/data/repository/show_books_base_repo.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/bloc/show_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ServiceLocator.init();
  // DioService().init();
  sl<DioService>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowBooksCubit(
        sl<ShowBooksBaseRepo>(),
      ),
      // ..getAction()
      // ..getProgramming()
      // ..getRomantic(),
      child: MaterialApp.router(
        title: 'The Books',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        routerConfig: GoCustomRouter.router,
      ),
    );
  }
}
//models
//cv pdf
//repo
///////
/////bloc
/////run
/////////blocBrovider navigator search
