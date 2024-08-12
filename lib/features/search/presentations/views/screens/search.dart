import 'package:book_views/core/service_locator/service_locator.dart';
import 'package:book_views/features/search/data/repo/search_base_repo.dart';
import 'package:book_views/features/search/presentations/manager/search_bloc.dart';
import 'package:book_views/features/search/presentations/manager/search_events.dart';
import 'package:book_views/features/search/presentations/views/components/custom_search_books.dart';
import 'package:book_views/features/search/presentations/views/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return BlocProvider(
        create: (context) => SearchBloc(sl<SearchBaseRepo>()),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    textEditingController: search,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(child: CustomSearchBooks())
                ],
              ),
            ),
          ),
        ));
  }
}
