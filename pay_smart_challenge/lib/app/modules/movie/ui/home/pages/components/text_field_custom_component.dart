import 'package:flutter/material.dart';
import '../../../../../../core/const/app_colors_const.dart';
import '../../../../../../core/const/app_textstyle_const.dart';
import '../../store/home_store.dart';

class TextFieldSearchCustomComponent extends StatelessWidget {
  const TextFieldSearchCustomComponent(
      {Key? key,
      required this.currentHeight,
      required this.currentWidth,
      required this.controller})
      : super(key: key);
  final double currentHeight;
  final double currentWidth;
  final HomeStore controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: currentHeight * 0.1,
      width: currentWidth * 0.95,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 2,
          color: AppColorsConst.borderInput,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStylesConst.inputTextField,
              onChanged: controller.searchMoviesUpComming,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search your movie',
                hintStyle: TextStylesConst.inputTextField,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColorsConst.whiteText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
