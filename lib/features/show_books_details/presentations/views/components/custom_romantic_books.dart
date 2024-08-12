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

class CustomRomanticBooks extends StatelessWidget {
  const CustomRomanticBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBooksCubit, ShowBooksStates>(
        builder: (context, state) {
      var cubit = ShowBooksCubit.get(context);
      if (state is ShowBooksRomanticErrorState) {
        return const AlignErrorWidget();
      }
      return cubit.romantic.isNotEmpty
          ? SizedBox(
              height: 150,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: cubit.romantic[index].imageUrl ??
                              CustomAssets.kLogo,
                          fit: BoxFit.fitWidth,
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
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                  itemCount: cubit.romantic.length),
            )
          : const AlignLoadingWidget();
    });
  }
}
