import 'package:book_views/core/utlis/fonts.dart';
import 'package:book_views/features/show_books_details/presentations/views/components/custom_actions_book.dart';
import 'package:book_views/features/show_books_details/presentations/views/components/custom_programming_book.dart';
import 'package:book_views/features/show_books_details/presentations/views/components/custom_romantic_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push("/search");
                  },
                  icon: Icon(
                    Icons.search,
                    size: CustomFonts.iconSize,
                  ))
            ],
          ),
          body: const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CustomProgrammingBooks(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomRomanticBooks(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverFillRemaining(child: CustomActionBooks()),
            ],
          )),
    );
  }
}
