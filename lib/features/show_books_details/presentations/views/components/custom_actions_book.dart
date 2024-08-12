import 'package:book_views/core/utlis/assets.dart';
import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:book_views/core/utlis/styes.dart';
import 'package:book_views/core/widgets/error_widget.dart';
import 'package:book_views/core/widgets/loading_widget.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/bloc/show_books_cubit.dart';
import 'package:book_views/features/show_books_details/presentations/manager/get_books_bloc/states/show_books_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomActionBooks extends StatelessWidget {
  const CustomActionBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBooksCubit, ShowBooksStates>(
        builder: (context, state) {
      var cubit = ShowBooksCubit.get(context);
      if (state is ShowBooksActionErrorState) {
        return const AlignErrorWidget();
      }
      return cubit.action.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: cubit.action[index].imageUrl ??
                                CustomAssets.kLogo,
                            width: 100,
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
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  cubit.action[index].quoteText ?? "",
                                  style: CustomTextStyle.style14.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Likes",
                                    style: CustomTextStyle.style12
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    cubit.action[index].likes ?? "0",
                                    style: CustomTextStyle.style12
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: cubit.action.length)
          : const AlignLoadingWidget();
    });
  }
}
