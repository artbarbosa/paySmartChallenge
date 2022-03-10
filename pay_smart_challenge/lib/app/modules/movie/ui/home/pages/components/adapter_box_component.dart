import 'package:flutter/material.dart';
import '../../../../../../core/const/app_textstyle_const.dart';
import '../../store/home_store.dart';
import 'text_field_custom_component.dart';

class AdapterBoxComponent extends StatelessWidget {
  const AdapterBoxComponent(
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
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: currentHeight * 0.03,
              left: currentWidth * 0.05,
            ),
            child: const Text('Movies', style: TextStylesConst.titleHome),
          ),
          Align(
            alignment: Alignment.center,
            child: TextFieldSearchCustomComponent(
              controller: controller,
              currentWidth: currentWidth,
              currentHeight: currentHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: currentHeight * 0.01,
              bottom: currentHeight * 0.02,
              left: currentWidth * 0.05,
            ),
            child: const Text(
              'Up Comming Movies',
              style: TextStylesConst.subTitleHome,
            ),
          ),
        ],
      ),
    );
  }
}
