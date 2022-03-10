import 'package:flutter/material.dart';
import '../../../../../core/const/app_colors_const.dart';
import '../store/home_store.dart';
import 'components/adapter_box_component.dart';
import 'components/list_movies_custom_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);

  final HomeStore controller;

  @override
  Widget build(BuildContext context) {
    final double currentHeight = MediaQuery.of(context).size.height;
    final double currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColorsConst.background,
      body: CustomScrollView(
        slivers: [
          AdapterBoxComponent(
            controller: controller,
            currentHeight: currentHeight,
            currentWidth: currentWidth,
          ),
          ListMoviesComponent(
            controller: controller,
            currentHeight: currentHeight,
            currentWidth: currentWidth,
          )
        ],
      ),
    );
  }
}
