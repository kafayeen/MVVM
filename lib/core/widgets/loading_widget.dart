import 'package:book_views/core/utlis/colors.dart';
import 'package:flutter/material.dart';

class AlignLoadingWidget extends StatelessWidget {
  const AlignLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: CustomColor.textColor,
      ),
    );
  }
}
