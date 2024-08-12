import 'package:book_views/core/utlis/assets.dart';
import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:book_views/core/widgets/error_widget.dart';
import 'package:book_views/core/widgets/loading_widget.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/bloc/show_books_cubit.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/states/show_books_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProgrammingBooks extends StatelessWidget {
  const CustomProgrammingBooks({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBooksCubit, ShowBooksStates>(
        builder: (context, state) {
      var cubit = ShowBooksCubit.get(context);
      if (state is ShowBooksProgrammingErrorState) {
        return const AlignErrorWidget();
      }
      return cubit.programming.isNotEmpty
          ? SizedBox(
              height: 200,
              child: ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: CachedNetworkImage(
                    imageUrl:
                        cubit.programming[index].imageUrl ?? CustomAssets.kLogo,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: CustomColor.textColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.ac_unit_rounded,
                        color: CustomColor.scaffoldDark,
                        size: CustomFonts.iconSize,
                      ),
                    ),
                  ),
                ),
                itemCount: cubit.programming.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            )
          : const AlignLoadingWidget();
    });
  }
}
