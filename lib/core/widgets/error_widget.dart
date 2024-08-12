import 'package:book_views/core/utlis/colors.dart';
import 'package:book_views/core/utlis/fonts.dart';
import 'package:flutter/material.dart';

class AlignErrorWidget extends StatelessWidget {
  const AlignErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.error,
        size: CustomFonts.iconSize,
        color: CustomColor.textColor,
      ),
    );
  }
}
