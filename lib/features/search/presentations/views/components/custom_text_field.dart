import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:book_views/core/utlis/styes.dart';
import 'package:book_views/features/search/presentations/manager/search_bloc.dart';
import 'package:book_views/features/search/presentations/manager/search_events.dart';
import 'package:book_views/features/search/presentations/manager/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchStates>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: TextFormField(
          controller: textEditingController,
          onChanged: (text) {
            BlocProvider.of<SearchBloc>(context).add(
                SearchNameOfBookEvent(nameOfBook: textEditingController.text));
          },

          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColor.textColor,
                ),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColor.textColor,
                ),
                borderRadius: BorderRadius.circular(5)),
            suffix: Icon(
              Icons.search,
              color: CustomColor.textColor,
              size: CustomFonts.iconSize,
            ),
            labelText: "Search The Books",
            labelStyle: CustomTextStyle.style14,
            focusColor: CustomColor.textColor,
          ),
          cursorColor: CustomColor.textColor,
          // expands: true,
          // maxLines: null,
          // minLines: null,
          style: CustomTextStyle.style14,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
