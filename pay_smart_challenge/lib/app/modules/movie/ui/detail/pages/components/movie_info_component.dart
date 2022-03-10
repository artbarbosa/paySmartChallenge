import 'package:flutter/material.dart';
import '../../../../../../core/const/app_textstyle_const.dart';
import '../../../../model/movie_model.dart';
import '../../../home/pages/widgets/chip_category_custom_widget.dart';

class MovieInfoComponent extends StatelessWidget {
  const MovieInfoComponent(
      {Key? key,
      required this.currentHeight,
      required this.currentWidth,
      required this.movie,
      required this.listGenresMovie})
      : super(key: key);

  final double currentHeight;
  final double currentWidth;
  final MovieModel movie;
  final List<String> listGenresMovie;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: currentHeight * 0.06,
              vertical: currentWidth * 0.01,
            ),
            child: Text(
              movie.title,
              style: TextStylesConst.titleHome,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: currentHeight * 0.05,
              vertical: currentWidth * 0.01,
            ),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: movie.genreIds.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChipCategoryCustomWidget(
                      label: listGenresMovie[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: currentHeight * 0.05,
              vertical: currentWidth * 0.01,
            ),
            child: Text(
              movie.overview,
              style: TextStylesConst.movieInfo,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: currentHeight * 0.05,
              vertical: currentWidth * 0.01,
            ),
            child: Text(
              'Realease Date: ${movie.releaseDate}',
              style: TextStylesConst.movieInfo,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
