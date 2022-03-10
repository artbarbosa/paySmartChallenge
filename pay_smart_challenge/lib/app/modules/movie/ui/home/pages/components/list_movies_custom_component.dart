import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/home_store.dart';
import 'card_movie_component.dart';

class ListMoviesComponent extends StatelessWidget {
  const ListMoviesComponent({
    Key? key,
    required this.currentHeight,
    required this.currentWidth,
    required this.controller,
  }) : super(key: key);

  final HomeStore controller;
  final double currentHeight;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (ontext) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, idx) => CardMovieComponent(
            controller: controller,
            movie: controller.listMovieUpComming[idx],
            listGenres: controller.listGenresMovie,
            currentHeight: currentHeight,
            currentWidth: currentWidth,
          ),
          childCount: controller.listMovieUpComming.length,
        ),
      ),
    );
  }
}
