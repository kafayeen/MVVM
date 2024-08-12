import 'package:book_views/core/utlis/assets.dart';
import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:book_views/core/utlis/styes.dart';
import 'package:book_views/core/widgets/error_widget.dart';
import 'package:book_views/core/widgets/loading_widget.dart';
import 'package:book_views/features/search/presentations/manager/search_bloc.dart';
import 'package:book_views/features/search/presentations/manager/search_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBooks extends StatelessWidget {
  const CustomSearchBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchStates>(builder: (context, state) {
      if (state is SearchSuccessState) {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.searchModel[index].imageUrl ??
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
                            Text(
                              state.searchModel[index].title ?? "",
                              style: CustomTextStyle.style15,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                state.searchModel[index].author?[0].name ?? "",
                                style: CustomTextStyle.style14.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rating",
                                  style: CustomTextStyle.style12
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.searchModel[index].rating ?? "0",
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
            itemCount: state.searchModel.length);
      }
      if (state is SearchLoadingState) {
        return const AlignLoadingWidget();
      } else {
        return const AlignErrorWidget();
      }
    });
  }
}
