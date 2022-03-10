import 'package:flutter/material.dart';
import '../../../../../../core/const/app_colors_const.dart';
import '../../../../../../core/const/app_textstyle_const.dart';

class ChipCategoryCustomWidget extends StatelessWidget {
  final String label;

  const ChipCategoryCustomWidget({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Chip(
        label: Text(
          label,
          style: TextStylesConst.movieCategoryChip,
        ),
        backgroundColor: AppColorsConst.whiteText,
      ),
    );
  }
}
