import 'package:book_views/features/search/presentations/views/screens/search.dart';
import 'package:book_views/features/show_books_details/presentations/views/screens/home.dart';
import 'package:book_views/features/splash.dart';
import 'package:go_router/go_router.dart';

abstract class GoCustomRouter {
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
    GoRoute(path: "/search", builder: (context, state) => const SearchScreen()),
  ]);
}
