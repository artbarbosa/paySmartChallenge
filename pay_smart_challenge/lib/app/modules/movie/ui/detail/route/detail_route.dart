import 'package:flutter/material.dart';
import '../pages/detail_page.dart';
import 'detail_arguments.dart';

class DetailRouter extends StatelessWidget {
  const DetailRouter({Key? key, required this.arguments}) : super(key: key);
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      movie: arguments.movie,
      listGenresMovie: arguments.listGenresMovie,
      imagePost: arguments.imagePost,
    );
  }
}
