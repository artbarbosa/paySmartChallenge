import 'package:flutter/material.dart';
import '../../../../../core/const/app_colors_const.dart';
import '../../../../../core/const/app_textstyle_const.dart';
import '../store/home_store.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.controller}) : super(key: key);
  final HomeStore controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsConst.background,
      body: Center(
        child: Text(
          controller.error,
          style: TextStylesConst.movieInfo,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColorsConst.primary,
        onPressed: () {
          controller.fetchMoviesUpComming();
          controller.fetchGenresMovies();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
