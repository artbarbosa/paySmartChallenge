import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/const/api_consts.dart';
import '../../../../../../core/const/app_colors_const.dart';
import '../../../../../../core/const/app_textstyle_const.dart';
import '../../../../model/genres_movies_model.dart';
import '../../../../model/movie_model.dart';
import '../../../detail/route/detail_arguments.dart';
import '../../store/home_store.dart';
import '../widgets/chip_category_custom_widget.dart';

class CardMovieComponent extends StatelessWidget {
  const CardMovieComponent(
      {Key? key,
      required this.currentHeight,
      required this.currentWidth,
      required this.movie,
      required this.listGenres,
      required this.controller})
      : super(key: key);
  final HomeStore controller;
  final List<GenresMoviesModel> listGenres;
  final MovieModel movie;
  final double currentHeight;
  final double currentWidth;

  @override
  Widget build(BuildContext context) {
    List<String> listGenresNames = [];

    final imagePost = CachedNetworkImage(
      imageUrl: ApiConst.requestIMG(movie.posterPath!),
      placeholder: (context, url) => const CircularProgressIndicator.adaptive(
        backgroundColor: AppColorsConst.background,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColorsConst.background,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/detail',
              arguments: DetailArguments(
                movie: movie,
                listGenresMovie: listGenresNames,
                imagePost: imagePost,
              ),
            );
          },
          child: Container(
            height: currentHeight * 0.3,
            width: currentWidth * 0.9,
            decoration: BoxDecoration(
              color: AppColorsConst.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: SizedBox(
                    child: Hero(
                      tag: movie.id,
                      child: movie.posterPath != null ? imagePost : Container(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStylesConst.movieTitleHome,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            itemCount: movie.genreIds.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              listGenresNames =
                                  controller.fetchGenreById(movie.genreIds);
                              return ChipCategoryCustomWidget(
                                  label: listGenresNames[index]);
                            },
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Release Date: ' + movie.releaseDate,
                            style: TextStylesConst.movieInfo,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
